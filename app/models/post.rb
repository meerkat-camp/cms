class Post < ApplicationRecord
  include Editable

  belongs_to :site

  before_validation :normalize_slug
  validates :slug, uniqueness: { scope: :site_id }
  validates :slug, format: { with: %r{\A/[a-z0-9-]+\z} }, allow_nil: true

  scope :latest, -> { order(created_at: :desc) }

  private

  def normalize_slug
    self.slug = nil if slug.blank?
  end
end
