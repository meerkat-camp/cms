class PagesController < ApplicationController
  before_action :set_page, only: %i[edit update destroy]

  def index
    @pages = current_site.pages
  end

  def new
    @page = current_site.pages.new
  end

  def edit; end

  def create
    @page = current_site.pages.new(page_params)
    @page.save
    current_site.publish
  end

  def update
    @page.update(page_params)
    current_site.publish
  end

  def destroy
    @page.destroy
    current_site.publish
  end

  private

  def set_page
    @page = current_site.pages.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :emoji, :content, :created_at)
  end
end
