class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = build_success_message(@user, 'Created')
      redirect_to @user
    else
      # Go back to the list screen
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = find_user_by_id(params[:id])
  end

  def show
    @user = find_user_by_id(params[:id])
  end

  def update
    # Get the lastest version of the user first.
    @user = find_user_by_id(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = build_success_message(@user, 'Updated')
      # Go back to the list screen
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

    # Helper method so we don't duplicate code
    def build_success_message(user, action)
      "The user #{@user.f_name} #{@user.l_name} has been #{action} successfully."
    end

    # This limits the parms that we'll take from the client
    def user_params
      # If they didn't supply a password then we want to keep what's in the db
      if supplied_password_on_update?
        params.require(:user).permit(:f_name, :l_name, :email, :admin)
      else
        params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation, :admin)
      end
    end

    # Just a test to see if on update they decided to change their password
    def supplied_password_on_update?
      !params[:user][:id].nil? && !params[:user][:password].blank? && !params[:user][:password_confirmation].blank?
    end

    # User.find(user_id) is called often, so shoving it in it's own method
    def find_user_by_id(user_id)
      @user = User.find(user_id)
    end
end
