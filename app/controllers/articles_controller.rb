class ArticlesController < ApplicationController
  before_action :force_login, except: [:index]

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new article_params

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
