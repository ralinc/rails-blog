class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    authenticate_user! if status
    @articles = ArticlesFilter.run status
  end

  def show
    authenticate_user! unless article.published?
    article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    article
  end

  def update
    if article.update article_params
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
    params.require(:article).permit(:title, :slug, :tags_string, :date, :status, :content)
  end

  def article
    @article ||= ArticleFinder.run params[:id]
  end

  def status
    @status ||= params[:status]
  end
end
