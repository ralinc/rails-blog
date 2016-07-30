class ArticlesController < ApplicationController
  before_action :force_login, except: [:index, :show]
  before_action :article, only: [:show, :edit]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if article.update_attributes article_params
      redirect_to article
    else
      render :edit
    end
  end

  def destroy
    article.destroy
    redirect_to articles_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :slug, :content)
  end

  def article
    @article ||= Article.find params[:id]
  end
end
