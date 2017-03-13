class TagsController < ApplicationController

  # list of tags
  def index
    @tag = Tag.all
  end

  # display tag
  def show
    @tag = Tag.find(params[:id])
  end

  # delete a tag
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' was successfully deleted"

    redirect_to action: 'index'
  end

end
