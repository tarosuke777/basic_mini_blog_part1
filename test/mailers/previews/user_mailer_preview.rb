# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/comment_notification
  def comment_notification
    comment = Comment.includes([:user, {post: [:user] }]).find(4)
    UserMailer.comment_notification(comment)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/ranking_notification
  def ranking_notification

    from = Time.current.beginning_of_day - 10.day
    to = Time.current.end_of_day - 0.day
    limit = 10

    posts = Post
                .joins(:user)
                .left_outer_joins(:likes)
                .select('posts.id, posts.created_at, posts.content, users.username, count(likes.id) AS likes_count')
                .where(created_at: from..to)
                .group('posts.id')
                .having("likes_count >= ?", 1)
                .order("likes_count desc, posts.created_at asc")

    UserMailer.ranking_notification(User.find(1), posts, from, to, limit)
  end  
end
