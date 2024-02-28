class NavigationItemsController < ApplicationController
  before_action :set_navigation

  def new
    @navigation_item = NavigationItem.new(navigation: @navigation)
  end

  def create
    navigation_item = @navigation.navigation_items.new(navigation_item_params)

    if navigation_item.save
      turbo_redirect_to(site_navigations_path(current_site))
    end
  end

  def destroy
    @navigation.navigation_items.find_by(public_id: params[:id]).destroy
    turbo_redirect_to(site_navigations_path(current_site))
  end

  private

  def navigation_item_params
    params.require(:navigation_item).permit(:title, :external_url)
  end

  def set_navigation
    @navigation = current_site.navigations.find_by(public_id: params[:navigation_id])
  end
end
