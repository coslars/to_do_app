class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  skip_before_filter :authenticated, except: [:foo, :bar]

  #
  # This locks down the entire application so we don't have to run a before method on each controller
  #
  def authenticated
    signed_in?
  end
end
