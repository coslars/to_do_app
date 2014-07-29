class SessionsController < ApplicationController

  def new
  end

  def show
    current_user
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # Call to the included (via ApplicationController) sign_in method
      sign_in user
      render 'show'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
