class Image < ApplicationRecord
  scope :orphaned, -> { where(imageable: nil).where('created_at < ?', 2.days.ago) }

  SIZES = {
    mobile_x1: 430,
    mobile_x2: 860,
    desktop_x1: 1000,
    mobile_x3: 1290,
    desktop_x2: 2000
  }.freeze
  FORMATS = %i[avif webp].freeze

  def self.variant_keys
    SIZES.map { |name, _| FORMATS.map { |format| "#{name}_#{format}".to_sym } }.flatten + [:desktop_x1_jpg]
  end

  def self.variant_options(size:, format:)
    { resize_to_limit: [size, size], format:, saver: { strip: true } }
  end

  belongs_to :site
  belongs_to :imageable, polymorphic: true, optional: true

  scope :assigned, -> { where.not(imageable: nil) }

  has_one_attached :file do |attachable|
    attachable.variant :desktop_x1_jpg, **variant_options(size: 1000, format: :jpg)

    SIZES.each do |size_name, size|
      FORMATS.each do |format|
        key = "#{size_name}_#{format}".to_sym
        attachable.variant key, **variant_options(size:, format:)
      end
    end
  end

  validates :file, presence: true

  def height
    file.metadata['height']
  end

  def width
    file.metadata['width']
  end

  def fs_path(variant: nil)
    return unless file.attached?

    key = variant ? file.variant(variant).processed.key : file.key

    ActiveStorage::Blob.service.path_for(key)
  end
end
