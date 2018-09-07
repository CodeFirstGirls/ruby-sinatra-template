require 'rubygems'
require 'bundler'

Bundler.require
require_relative 'email.rb'

  get('/') do
    erb :hello 
  end
    

  post('/signup') do 
    puts params[:name] 
    puts params[:email]
    
    Email.new(params[:name], params[:email]).send_email
    "All signed up to our mailing list!" 
  end
