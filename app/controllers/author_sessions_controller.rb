class AuthorSessionsController < ApplicationController
def new
  end

before_filter :require_login, except: [:new, :create]

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, message: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: 'Logged out!')
  end
end
