class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_profile.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :location, :body, :photo)
  end
end
