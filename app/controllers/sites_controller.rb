class SitesController < ApplicationController
  def index
    authorize(Site)
    @sites = policy_scope(Site)
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
      domain: current_site.domain,
      theme_id: current_site.theme_id
    )
  end

  def create
    authorize(Site)

    @site = Sites::CreateSite.run(site_params)

    turbo_redirect_to(site_posts_path(@site.result), notice: t('.notice')) if @site.valid?
  end

  def update
    authorize(current_site)

    @site = Sites::UpdateSite.run(site_params.merge(site: current_site))

    return unless @site.valid?

    turbo_redirect_to(edit_site_path(@site.result), notice: t('.notice'))
    current_site.publish
  end

  private

  def set_site
    @set_site ||= policy_scope(Site).find_by(public_id: params[:id])
  end

  def site_params
    params.require(:site).permit(:title, :language_code, :domain, :theme_id).merge(current_user:)
  end
end
