class TagsController < ApplicationController
    # before_filter :require_login, only: [:destroy]
  def index 
      @tags = Tag.all 
  end


    def show
        @tag = Tag.find(params[:id])
    end
    def destroy 
        tag = Tag.find(params[:id])
        string = tag.name
        tag.destroy
        flash.notice = "Tag '#{string}' has been Destroyed!!"
        redirect_to tags_path(index)
    end
    
end
