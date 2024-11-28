class NavigationItemsController < ApplicationController
  before_action :set_navigation_item, only: %i[destroy move_up move_down]
  after_action :publish_current_site

  def create
    @page = Page.find(params[:page_id])
    authorize(@page, :add_to_navigation?)
    current_site.main_navigation.add(@page)
    redirect_to_pages_index(current_site)
  end

  def destroy
    @navigation_item.destroy
    redirect_to_pages_index(@navigation_item.site)
  end

  def move_up
    @navigation_item.move_up
    redirect_to_pages_index(@navigation_item.site)
  end

  def move_down
    @navigation_item.move_down
    redirect_to_pages_index(@navigation_item.site)
  end

  private

  def redirect_to_pages_index(site)
    turbo_redirect_to(site_pages_path(site), notice: t('.notice'))
  end

  def set_navigation_item
    @navigation_item = NavigationItem.find(params[:id])
    @set_site ||= @navigation_item.site
    authorize @navigation_item
  end
end
