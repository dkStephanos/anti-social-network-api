require 'toki_toki'
require 'Authenticator'

class AuthenticationController < ApplicationController
  def github

    authenticator = Authenticator.new
    user_info = authenticator.github(params[:code])

    login = user_info[:login]
    name = user_info[:name]
    avatar_url = user_info[:avatar_url]
    bio = user_info[:bio]
    # Generate token...
    token = TokiToki.encode(login)
    # ... create user if it doesn't exist...
    User.where(login: login).first_or_create!(
      name: name,
      avatar_url: avatar_url,
      bio: bio
    )
    # ... and redirect to client app.
    redirect_to "#{issuer}?token=#{token}"
  rescue StandardError => error
    redirect_to "#{issuer}?error=#{error.message}"
  end

  private

  def issuer
    ENV['ANTISOCIALNETWORK_CLIENT_URL']
  end
end