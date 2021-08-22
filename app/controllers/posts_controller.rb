class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @posts = Post.includes(:user, :liked_users).all.order(created_at: :desc).limit(20)
  end

  def following
    @posts = Post.includes(:user, :liked_users).where(user_id: current_user.following).order(created_at: :desc).limit(20)
  end

  def show
    @post = Post.includes(:user, :liked_users, :comments).find(params[:id])
  end

  def create
    @post = current_user.created_posts.build(post_params)

    begin
      if @post.save
        redirect_to root_path
      end
    rescue Cloudinary::CarrierWave::UploadError 
      @post.destroy
      @post.errors.add(:image, t('errors.messages.cloudinary_upload_error'))
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

end
