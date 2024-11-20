class SocialMediaLink < ApplicationRecord
  belongs_to :site

  validates :url, presence: true
  validates :name, presence: true
  validates :icon, presence: true, inclusion: { in: SocialMediaService.all.map(&:icon) }

  def svg
    SocialMediaService.all.find { |s| s.icon == icon }&.svg
  end
end
