class PagesController < ApplicationController
  include Paginatable

  before_action :set_page, only: %i[edit update destroy]

  def index
    @pagy, @pages = pagy(current_site.pages)
  end

  def new
    @page = current_site.pages.new
  end

  def edit; end

  def create
    @page = current_site.pages.new(page_params)
    return unless @page.save

    redirect_to_index(t('.notice'))
    current_site.publish
  end

  def update
    return unless @page.update(page_params)

    redirect_to_index(t('.notice'))
    current_site.publish
  end

  def destroy
    @page.destroy

    current_site.publish
    redirect_to_index(t('.notice'))
  end

  private

  def redirect_to_index(notice)
    turbo_redirect_to(site_pages_path(current_site), notice:)
  end

  def set_page
    @page = current_site.pages.find_by(public_id: params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :emoji, :content, :created_at)
  end
end
