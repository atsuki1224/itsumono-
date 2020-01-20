class PostsController < ApplicationController

  def index
    session[:group_id] = params[:id]
  end

  def new
    @post = Post.new
    @post = session[:group_id]
  end

  def create
    @post = Post.new(name: params[:name], image: params[:image], capacity: params[:capacity], comment: params[:comment], group_id: params[:group_id])
    binding.pry
    @post.save
    redirect_to root_path
  end

  private
  def post_params
    params.permit(:name, :image, :capacity, :comment, :group_id, :created_at, :updated_at)
  end

end
