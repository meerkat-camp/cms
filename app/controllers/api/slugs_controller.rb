module Api
  class SlugsController < ApplicationController
    def create
      site = Site.find(params[:site_id])

      new_slug = SlugGenerator.new(site).generate(params[:slug])
      return head(:ok) if new_slug == params[:slug]

      render plain: new_slug, status: :locked
    end
  end
end
