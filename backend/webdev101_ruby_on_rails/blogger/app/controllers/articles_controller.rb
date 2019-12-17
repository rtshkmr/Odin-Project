class ArticlesController < ApplicationController
    # include modules here:
    include ArticlesHelper

    #ArticlesController methods
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])


        # creating the blank comment object:
        @comment = Comment.new
        #  wrong example: 
        # @comment = @article.comments.new 
        
        @comment.article_id = @article.id


    end
    def new
        @article = Article.new
    end
    
    def create
    # passing in the whole hash for the article will throw error:
    # ======================================
        # @article = Article.new(params[:article])   <--------------- this is a security risk, hence will throw error
        @article = Article.new(article_params) # <------------ articles_params is a helper method defined in articles_helper.rb
        # rmb to save and redirect
        @article.save
        flash.notice = "A new article:'#{@article.title}' has been created!"

        redirect_to article_path(@article)


    # an attempt at one-by-one getting out the hash, which might be unnecessary, as we could just pass in the whole hash:
    # =====================================================================================================================
    # @article = Article.new(
    #     title: params[:article][:title],
    #     body: params[:article][:body])
    #   @article.save
    #   redirect_to article_path(@article)

    #  this way not recommended because the instance variables are known to the controller, and we don't want the controller to know too much:
    # ===============================================================================================================
    #     @article = Article.new
    #     @article.title = params[:article][:title]
    #     @article.body = params[:article][:body]
    #     @article.save

    #     redirect_to article_path(@article)
    end

    def destroy 
        article = Article.find(params[:id])
        string = article.title
        article.destroy
        flash.notice = "Article '#{string}' has been Destroyed!!"
        redirect_to articles_path(index)
    end


    # edit action finds the object (article) and displays the form
    def edit 
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        # add in a flash to notify user:
        flash.notice = "Article '#{@article.title}' Updated!"

        # do the necessary redirection after the action
        redirect_to article_path(@article)
    end

    
end
