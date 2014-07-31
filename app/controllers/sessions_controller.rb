class SessionsController < ApplicationController

  # This controller allows for non-authenticated user access skip the validate_login filter
  skip_before_filter :validate_login, :except => [:show, :destroy]

  # Show the login page
  def new
    render 'new', layout: 'login'
  end

  # Right now this is the landing page
  def show
    current_user
  end

  # Log the user in
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # Call to the included (via ApplicationController) sign_in method
      sign_in user
      redirect_back_or "/sessions/#{current_user.id}"
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new', layout: 'login'
    end
  end

  # Log the user out
  def destroy
    sign_out
    redirect_to root_url
  end
end
