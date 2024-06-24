class NavigationsController < ApplicationController
  def index
    @navigations = current_site.navigations
  end

  def create
    @menu = current_site.navigations.find_or_create_by(navigation_params)
    redirect_to site_navigations_path(current_site)
  end

  private

  def navigation_params
    params.require(:navigation).permit(:type)
  end
end
