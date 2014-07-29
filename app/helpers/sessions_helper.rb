module SessionsHelper

  def sign_in(user)

    # Create a new token
    remember_token = User.new_remember_token

    # Put the token in the browsers cookie
    cookies.permanent[:remember_token] = remember_token

    # Save the remember token to the DB
    user.update_attribute(:remember_token, User.digest(remember_token))

    # Set the current user equal to the logged in user
    self.current_user = user
  end

  # Tester method so we don't have to check if the current_user is nil everywhere
  def signed_in?
    !current_user.nil?
  end

  # current_user Setter
  def current_user=(user)
    @current_user = user
  end

  # current_user Getter
  def current_user

    if !@current_user

      # Figure out the remember token from the user's cookie
      remember_token = User.digest(cookies[:remember_token])

      # If we don't have a current user
      @current_user ||= User.find_by(remember_token: remember_token)
    else

      # We already have a user return it
      @current_user
    end
  end
end