class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      if current_user.email.present?
        UserMailer.comment_notification(@comment).deliver_now
      end
      redirect_to post_path(id: @comment.post_id)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)
    comment.destroy!
    redirect_to post_path(post)
  end

  private 
  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

end
