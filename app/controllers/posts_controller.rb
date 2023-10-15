class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = current_site.posts.latest
  end

  def new
    @post = current_site.posts.new
  end

  def edit; end

  def create
    @post = current_site.posts.new(post_params)
    return unless @post.save

    redirect_to_index(t('.notice'))
    current_site.publish
  end

  def update
    return unless @post.update(post_params)

    redirect_to_index(t('.notice'))
    current_site.publish
  end

  def destroy
    @post.destroy
    current_site.publish
  end

  private

  def redirect_to_index(notice)
    turbo_redirect_to(site_posts_path(current_site), notice:)
  end

  def set_post
    @post = current_site.posts.find_by!(public_id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :slug, :emoji, :content, :created_at)
  end
end
