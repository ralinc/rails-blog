class ArticlesController < ApplicationController
  before_action :force_authentication, except: [:index, :show]
  before_action :article, only: [:show, :edit]

  def index
    force_authentication if params[:show]
    @articles = ArticlesService.filter params[:show]
  end

  def show
    force_authentication if article.status != 'published'
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
    params.require(:article).permit(:title, :slug, :tags_string, :status, :content)
  end

  def article
    @article ||= Article.find_by slug: params[:id]
  end
end
