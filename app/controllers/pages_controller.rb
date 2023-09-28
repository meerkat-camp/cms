class PagesController < ApplicationController
  before_action :set_page, only: %i[edit update destroy]

  def index
    @pages = @site.pages
  end

  def new
    @page = @site.pages.new
  end

  def edit; end

  def create
    @page = @site.pages.new(page_params)
    @page.save
    @site.publish
  end

  def update
    @page.update(page_params)
    @site.publish
  end

  def destroy
    @page.destroy
    @site.publish
  end

  private

  def set_page
    @page = @site.pages.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :slug, :emoji, :content, :created_at)
  end
end
