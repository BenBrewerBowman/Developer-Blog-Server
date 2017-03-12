class ArticlesController < ApplicationController

  include ArticlesHelper

  # list of articles
  def index
    @articles = Article.all
  end

  # display article
  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  # new article in DB
  def new
    @article = Article.new
  end

  # create a new article
  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' was successfully created"

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

    flash.notice = "Article '#{@article.title}' was successfully updated"

    redirect_to article_path(@article)
  end

  # delete an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' was successfully deleted"

    redirect_to articles_path()
  end

end
