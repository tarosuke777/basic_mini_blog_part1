class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.includes(:user).all.order(created_at: :desc).limit(20)
  end

  def following
    @posts = Post.includes(:user).where(user_id: current_user.following).order(created_at: :desc).limit(20)
  end

  def create
    @post = current_user.created_posts.build(post_params)

    if @post.save
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
