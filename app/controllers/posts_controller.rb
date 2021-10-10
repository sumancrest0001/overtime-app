class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.posts_by current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'Your post is created successfully'
    else
      render new
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
    redirect_to @post, notice: "You post has been successfully updated."
    else
      redirect_to :edit
    end
  end

  def destroy
    if @post.delete
      redirect_to posts_path, notice: "Your post is deleted successfully"
    else
      redirect_to posts_path, notice: "Sorry, Post is not deleted"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end
end
