class NavigationComponent < ViewComponent::Base
  def initialize(navigation:)
    @navigation = navigation
  end

  def title
    t("navigation.title.#{@navigation.type}")
  end

  def navigation_items
    items = @navigation.navigation_items.includes(:children).where(parent_id: nil)
  end

  def new_item_path
    new_site_navigation_navigation_item_path(@navigation.site, @navigation)
  end
end
