class Site < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :site_users, dependent: :destroy
  has_many :users, through: :site_users
  has_many :deployment_targets, dependent: :destroy
  has_many :navigations, dependent: :destroy

  after_create do
    navigations.create(type: 'main')
    navigations.create(type: 'footer')
  end

  def publish(to: :staging)
    deployment_targets.where(type: to.to_s).find_each(&:deploy)
  end

  def emoji
    '🗼'
  end

  def summary_length
    30
  end
end
