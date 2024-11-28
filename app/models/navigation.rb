class Navigation < ApplicationRecord
  belongs_to :site
  has_many :navigation_items, dependent: :destroy

  def add(page)
    navigation_items.find_or_create_by!(page: page)
  end

  def remove(page)
    navigation_items.find_by(page: page)&.destroy
  end

  def include?(page)
    navigation_items.exists?(page:)
  end
end
