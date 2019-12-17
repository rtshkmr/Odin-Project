class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]

        @comment.save

        # choose wisely where to redirect. We want to redirect to the articles page!
        # call on @comment.article instead of @article. the former is guaranteed to exist in the controller action but the latter isn't
        redirect_to article_path(@comment.article)
    end
    
    def comment_params
        params.require(:comment).permit(:author_name, :body)    
    end
end
