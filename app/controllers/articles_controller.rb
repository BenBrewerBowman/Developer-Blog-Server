class ArticlesController < ApplicationController

  include ArticlesHelper

  # list of articles
  def index
    @articles = Article.all
  end

  # display article
  def show
    @article = Article.find(params[:id])
  end

  # new article in DB
  def new
    @article = Article.new
  end

  # create a new article
  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  # edit an article
  def edit
    @article = Article.find(params[:id])
  end

  # update an edit
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end
  # delete an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path()
  end

end
