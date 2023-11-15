class ApplicationController < ActionController::Base
  before_action :set_user_id

  private

  def set_user_id
    unless cookies[:user_id]
      cookies[:user_id] = SecureRandom.random_number(1000000).to_s
    end
  end
end
