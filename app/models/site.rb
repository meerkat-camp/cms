class Site < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :site_users, dependent: :destroy
  has_many :users, through: :site_users

  def publish
    BuildHugoSiteJob.perform_later(self)
  end

  def emoji
    '🗼'
  end

  def summary_length
    30
  end

  def hugo_dir
    Rails.root.join('tmp', 'hugo', id.to_s)
  end

  def site
    self
  end
end
