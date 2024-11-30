class NavigationItem < ApplicationRecord
  delegate :site, to: :navigation
  delegate :title, :slug, :emoji, to: :page

  belongs_to :navigation
  belongs_to :page

  positioned on: :navigation

  scope :ordered, -> { order(:position) }

  def move_up
    update(position: { before: prior_position })
  end

  def move_down
    update(position: { after: subsequent_position })
  end

  def last?
    position == navigation.navigation_items.maximum(:position)
  end

  def first?
    position == navigation.navigation_items.minimum(:position)
  end
end
