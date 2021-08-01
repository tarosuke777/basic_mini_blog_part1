class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new 
    @article = Article.new
  end

  def create
    @article = Article.new(content: params[:article][:content])

    if @article.save
      redirect_to action: "index"
    else
      render :new
    end
  end
  
end
