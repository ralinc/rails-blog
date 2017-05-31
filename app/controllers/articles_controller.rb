class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    authenticate_user! if status

    @articles = ArticlesFilter.run(status).page(page).decorate
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
      flash.now[:error] = error_message
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
      flash.now[:error] = error_message
      render :edit
    end
  end

  def destroy
    article.destroy
    redirect_to articles_url
  end

  private

  def error_message
    article.errors.full_messages.to_sentence
  end

  def article_params
    params.require(:article).permit(:title, :slug, :tags_string, :date, :status, :content)
  end

  def article
    @article ||= ArticleFinder.run params[:id]
  end

  def status
    @status ||= params[:status]
  end

  def page
    @page ||= params[:page]
  end
end
