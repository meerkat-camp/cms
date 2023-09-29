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
    @post.save
    current_site.publish
  end

  def update
    return unless @post.update(post_params)

    current_site.publish

    @posts = current_site.posts.latest
  end

  def destroy
    @post.destroy
    current_site.publish
  end

  private

  def set_post
    @post = current_site.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :emoji, :content, :created_at)
  end
end
