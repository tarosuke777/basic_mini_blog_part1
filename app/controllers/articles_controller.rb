class ArticlesController < ApplicationController
  def index
    @articles = Article.all
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
