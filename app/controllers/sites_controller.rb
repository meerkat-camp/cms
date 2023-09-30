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

    @site = Sites::CreateSite.run(site_params)

    return turbo_redirect_to(site_path(@site.result), notice: t('.notice')) if @site.valid?
  end

  def edit
    authorize(current_site)

    @site = Sites::UpdateSite.new(
      site: current_site, title: current_site.title, language_code: current_site.language_code, domain: current_site.domain
    )
  end

  def update
    authorize(current_site)

    @site = Sites::UpdateSite.run(site_params.merge(site: current_site))

    return turbo_redirect_to(site_path(@site.result), notice: t('.notice')) if @site.valid?
  end

  private

  def set_site
    @set_site ||= policy_scope(Site).find_by(id: params[:id])
  end

  def site_params
    params.require(:site).permit(:title, :language_code, :domain).merge(current_user:)
  end
end
