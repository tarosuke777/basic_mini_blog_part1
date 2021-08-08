class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new 
    @article = current_user.created_articles.build
  end

  def create
    @article = current_user.created_articles.build(article_params)

    if @article.save
      redirect_to root_path, notice: "article created"
    end
  end

  private

  def article_params
    params.require(:article).permit(:content)
  end

end
