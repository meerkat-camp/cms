class ImagesController < ApplicationController
  ALLOWED_IMAGEABLES = %w[post page].freeze

  before_action :find_imageable, only: %i[create from_url]

  def show
    @image = policy_scope(Image).find_by(public_id: params[:id])
    authorize(@image)

    response.headers['Expires'] = 1.year.from_now.httpdate

    send_file(@image.fs_path, disposition: 'inline', type: @image.file.content_type)
  end

  def create
    @image = current_site.images.create(file: params[:image], imageable: @imageable)

    render_json(:create)
  end

  def from_url
    @image = image_from_url(params[:url])

    render_json(:create)
  end

  private

  def image_from_url(url)
    url = ExternalUrlChecker.new(url).check!
    RemoteImageCreator.new(current_site, @imageable).create_from(url)
  rescue RemoteImageCreator::Error, ExternalUrlChecker::Error
    # Editorjs will show, that image upload failed.
    nil
  end

  def find_imageable
    imageable_type = params[:imageable_type]
    imageable_id = params[:imageable_id]

    return if imageable_type.blank? || imageable_id.blank?
    return unless ALLOWED_IMAGEABLES.include?(imageable_type)

    @imageable = current_site.send(imageable_type.pluralize).find(imageable_id)
  end
end
