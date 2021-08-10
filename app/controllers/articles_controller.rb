class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @articles = Article.includes(:user).all.order(created_at: :desc).limit(20)
  end

  def following
    @articles = Article.includes(:user).where(user_id: current_user.following).order(created_at: :desc).limit(20)
  end

  def create
    @article = current_user.created_articles.build(article_params)

    if @article.save
      redirect_to root_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:content)
  end

end
