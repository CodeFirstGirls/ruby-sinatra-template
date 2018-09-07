require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'twitter'

get('/') do
  erb :hello 
end
  
get('/tweets/:search') do
  @search = params[:search]
  @tweets = TwitterAPIWrapper.new.get_tweets(@search)
  erb :tweets
end
