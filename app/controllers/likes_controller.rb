class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    if @like.save
      redirect_to post_path(id: params[:post_id])
    end
  end

  def destroy
    like = Like.find(params[:id])
    post = Post.find(like.post_id)
    like.destroy!
    redirect_to post_path(post)
  end
end
