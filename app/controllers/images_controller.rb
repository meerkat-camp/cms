class ImagesController < ApplicationController
  ALLOWED_IMAGEABLES = %w[post page].freeze

  before_action :find_imageable, only: %i[create from_url]

  def show
    @image = @site.images.find(params[:id])
    response.headers['Content-Type'] = @image.file.content_type
    response.headers['Content-Disposition'] = 'inline'
    render body: @image.file.download
  end

  def create
    @image = @site.images.create(file: params[:image], imageable: @imageable)

    render_json(:create)
  end

  def from_url
    @image = image_from_url(params[:url])

    render_json(:create)
  end

  private

  def image_from_url(url)
    RemoteImageCreator.new(@site, @imageable).create_from(url)
  rescue RemoteImageCreator::Error
    # Editorjs will show, that image upload failed.
    nil
  end

  def find_imageable
    imageable_type = params[:imageable_type]
    imageable_id = params[:imageable_id]

    return if imageable_type.blank? || imageable_id.blank?
    return unless ALLOWED_IMAGEABLES.include?(imageable_type)

    @imageable = @site.send(imageable_type.pluralize).find(imageable_id)
  end
end
