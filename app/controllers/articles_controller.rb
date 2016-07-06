class ArticlesController < ApplicationController
  before_action :force_login, except: [:index, :show]

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

  def show
    @article = Article.find_by id: article_id
    redirect_to articles_path unless @article
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def article_id
    @article_id ||= params[:id]
  end
end
