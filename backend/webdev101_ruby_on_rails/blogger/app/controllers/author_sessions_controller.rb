class AuthorSessionsController < ApplicationController
    def new
    end
  
    def create
      if login(params[:email], params[:password])
        redirect_back_or_to(articles_path, notice: 'At least you succeeded in logging in.')
      else
        flash.now.alert = "What a failure. Can't even login."
        render action: :new
      end
    end
  
    def destroy
      logout
      redirect_to(:articles, notice: 'Logged out!')
    end
  end