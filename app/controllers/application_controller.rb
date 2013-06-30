class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :upvote, :downvote]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :error => exception.message
  end
end
