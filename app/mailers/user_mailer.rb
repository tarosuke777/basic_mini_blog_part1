class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.comment_notification.subject
  #
  def comment_notification(comment)
    @comment = comment
    mail to: comment.post.user.email, subject: default_i18n_subject(created_at: l(@comment.post.created_at,  format: :short))
  end

  def ranking_notification(user, posts, from, to)
    @posts = posts
    @from = from
    @to = to
    mail to: user.email, subject: t("user_mailer.ranking_notification.subject")
  end
end
