class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = @site.posts.latest
  end

  def new
    @post = @site.posts.new
  end

  def edit; end

  def create
    @posts = @site.posts
    @post = @site.posts.new(post_params)

    return unless @post.save

    @site.publish
    @posts = @site.posts.latest
  end

  def update
    return unless @post.update(post_params)

    @site.publish
    @posts = @site.posts.latest
  end

  def destroy
    @post.destroy
    @site.publish
  end

  private

  def set_post
    @post = @site.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :emoji, :content, :created_at)
  end
end
