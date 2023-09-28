class SitesController < ApplicationController
  def index
    authorize(Site)
    @sites = policy_scope(Site)
  end

  def show
    @site = @current_site
  end

  def new
    authorize(Site)
    @site = Sites::CreateSite.new
  end

  def create
    authorize(Site)

    outcome = Sites::CreateSite.run(site_params)

    return turbo_redirect_to(site_path(outcome.result), notice: t('.notice')) if outcome.valid?

    @site = outcome
  end

  private

  def set_site
    @set_site ||= policy_scope(Site).find_by(id: params[:id])
  end

  def site_params
    params.require(:site).permit(:title).merge(current_user:)
  end
end
