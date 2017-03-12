class CommentsController < ApplicationController

  include ArticlesHelper

  # create a new article
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save

    flash.notice = "Comment was successfully added"

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  # edit an article
  # def edit
    # @article = Article.find(params[:id])
  # end

  # update an edit
  # def update
    # @article = Article.find(params[:id])
    # @article.update(article_params)

    # flash.notice = "Article '#{@article.title}' was successfully updated"

    # redirect_to article_path(@article)
  # end

  # delete an article
  # def destroy
    # @article = Article.find(params[:id])
    # @article.destroy

    # flash.notice = "Article '#{@article.title}' was successfully deleted"

    # redirect_to articles_path()
  # end

end
