namespace :ranking do
    desc '前日の「いいね」数ランキングが10位までの投稿をメール通知'
    task like_top10: :environment do

        from = Time.current.beginning_of_day - 1.day
        to = Time.current.end_of_day - 1.day
        limit = 10
   
        posts = Post
                     .joins(:user, :likes)
                     .select('posts.id, posts.created_at, posts.content, users.username, count(likes.id) AS likes_count')
                     .where(created_at: from..to)
                     .group('posts.id, posts.created_at, posts.content, users.username')
                     .having("likes_count >= ?", 1)
                     .order("likes_count desc, posts.created_at asc")
    
        if posts.present?
            users = User.where.not(email: nil)
            users.each do |user|
                UserMailer.ranking_notification(user, posts, from, to, limit).deliver
            end
        end
      end
end
