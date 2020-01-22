class PostsController < ApplicationController

  def index
    session[:group_id] = params[:id]
    @post = Post.where(group_id: session[:group_id])
  end

  def new
    @post = Post.new
    # @post = session[:group_id]
  end

  def create
    logger.info("post_params: #{params.require(:post).permit(:name, :image, :capacity, :comment, :created_at, :updated_at)}")
    logger.info("params : #{params[:post]}")
    @post = Post.new(post_params)
    @post.group_id = session[:group_id]
    @post.save
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :capacity, :comment, :created_at, :updated_at)
  end

end
