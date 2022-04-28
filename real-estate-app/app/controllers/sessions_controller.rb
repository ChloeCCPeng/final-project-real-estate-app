class SessionsController < ApplicationController
  
    def index
      session[:session_hello] ||= "World"
      cookies[:cookies_hello] ||= "World"
      render json: { session: session, cookies: cookies.to_hash }
    end
  
  end
  