class ArticlesController < ApplicationController
  before_action :force_authentication, except: [:index, :show]

  def index
    force_authentication if status
    @articles = ArticlesFilter.run status
  end

  def show
    force_authentication if wip?
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
    params.require(:article).permit(:title, :slug, :tags_string, :status, :content)
  end

  def article
    @article ||= ArticleFinder.run params[:id]
  end

  def status
    @status ||= params[:status]
  end

  def wip?
    @wip ||= !article.published?
  end
end
