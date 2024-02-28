class NavigationItemComponent < ViewComponent::Base
  attr_reader :navigation_item

  delegate :title, :external_url, to: :navigation_item

  def initialize(navigation_item:)
    @navigation_item = navigation_item
  end

  def children
  end
end
