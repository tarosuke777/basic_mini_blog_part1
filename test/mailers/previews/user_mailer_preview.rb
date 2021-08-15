# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/comment_notification
  def comment_notification
    comment = Comment.includes([:user, {post: [:user] }]).first
    UserMailer.comment_notification(comment)
  end

end
