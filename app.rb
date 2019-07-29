require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook'
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

cookbook = Cookbook.new("recipes.csv")

get '/' do
  @recipes = cookbook.recipes
  erb :index
end

get '/about' do
  erb :about
end

get '/create_form' do
  erb :create_form
end
