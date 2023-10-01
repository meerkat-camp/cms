class Image < ApplicationRecord
  belongs_to :site
  belongs_to :imageable, polymorphic: true, optional: true

  scope :assigned, -> { where.not(imageable: nil) }

  has_one_attached :file do |attachable|
    attachable.variant(
      :big_webp,
      resize_limit: '1800x1800',
      format: :webp
    )
  end

  validates :file, presence: true

  def height
    file.metadata['height']
  end

  def width
    file.metadata['width']
  end

  def fs_path
    return unless file.attached?

    ActiveStorage::Blob.service.path_for(file.key)
  end
end
