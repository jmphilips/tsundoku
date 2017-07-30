class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :user_has_match?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def user_has_match?
    user_book_states.include? 'accepted'
  end

  def user_book_states
    current_user.requests.map { |req| req.book.state }
  end

end
