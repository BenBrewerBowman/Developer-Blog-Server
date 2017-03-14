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

  before_filter :require_login, except: [:create]

end
