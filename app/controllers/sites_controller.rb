class SitesController < ApplicationController
  def index
    authorize(Site)
    @sites = policy_scope(Site)
  end

  def show
    @site = current_site
    @posts = current_site.posts.latest.limit(10)
  end

  def new
    authorize(Site)
    @site = Sites::CreateSite.new
  end

  def edit
    authorize(current_site)

    @site = Sites::UpdateSite.new(
      site: current_site,
      title: current_site.title,
      language_code: current_site.language_code,
      domain: current_site.domain
    )
  end

  def create
    authorize(Site)

    @site = Sites::CreateSite.run(site_params)

    turbo_redirect_to(site_path(@site.result), notice: t('.notice')) if @site.valid?
  end

  def update
    authorize(current_site)

    @site = Sites::UpdateSite.run(site_params.merge(site: current_site))

    turbo_redirect_to(site_path(@site.result), notice: t('.notice')) if @site.valid?
  end

  private

  def set_site
    @set_site ||= policy_scope(Site).find_by(public_id: params[:id])
  end

  def site_params
    params.require(:site).permit(:title, :language_code, :domain).merge(current_user:)
  end
end
