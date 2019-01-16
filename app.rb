require 'sinatra/base'
require 'sinatra/cookies'

class SimpleCookieDemo < Sinatra::Base
  helpers Sinatra::Cookies
  before do
    content_type 'text/plain'
    status 200
  end
  
  get '/' do
    body "Logged in: #{cookies[:logged_in] ? 'true' : 'false'}"
  end

  get '/login' do
    cookies[:logged_in] = true
    body 'Login cookie set'
  end

  get '/logout' do
    cookies.clear
    body 'Cookie destroyed'
  end

end
