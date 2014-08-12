class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  # Lock down the application run this filter on everything
  #  If there is a controller that needs to allow access to non-authenticated
  #  users then add skip_before_filter :validate_login
  #  or skip_before_filter :validate_login, :except => [:method1, :method2]
  before_filter :validate_login

  # I'm going to make this line super long to see if it's caught by Code Climate, I'm going to make this line super long to see if it's caught by Code Climate, I'm going to make this line super long to see if it's caught by Code Climate, I'm going to make this line super long to see if it's caught by Code Climate,

end
