require 'net/http'
require 'uri'
require 'JSON'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :auth_user

  def auth_user
    unless session[:user]
      if Rails.env.production? # will refuse to test this
        unless use_facebook_token(request.headers['Authorization'])
          render(:head, status: :unauthorized) && return unless @current_user
        end
      elsif Rails.env.test?
        # test will force set @current_user
        render(:head, status: :unauthorized) && return unless @current_user
      end
    end
  end

  private

  def use_facebook_token(token)
    return false if token.nil?
    uri = URI.parse "https://graph.facebook.com/me?fields=email&access_token=#{token}"
    fb = Net::HTTP.get_response(uri)

    if fb && fb.code == 200
      email = JSON.parse(fb.body)['email'] # if this exists then facebook has verified the token and found user for it
      user = User.find_by email: email
      session[:user] = user
      @current_user = user
      return true if session[:user]
    end
    false
  end
end
