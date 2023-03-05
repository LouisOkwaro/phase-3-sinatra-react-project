require 'bcrypt'
require 'sinatra'
require 'bcrypt'
require 'json'
require_relative '../models/user'
require 'sinatra/session'



class UserController < Sinatra::Base

    enable :sessions

    post '/users/register' do

      
      # Get user information from request body
      data = JSON.parse(request.body.read)
    
      # Create a new user object
      user = User.new(
        name: data['name'],
        email: data['email'],
        password: data['password']
      )