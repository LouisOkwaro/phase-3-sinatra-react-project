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

       # Save the user to the database
       if user.save
        # Return success message
        { message: 'Account created successfully' }.to_json
      else
        # Return error message
        halt 400, { error: user.errors.full_messages.join(', ') }.to_json
      end
    end

    post '/users/login' do

        # Get user information from request body
        data = JSON.parse(request.body.read)
    
        # Find user by email
        user = User.find_by(email: data['email'])
    
        # Check if user exists and password matches
        if user && user.authenticate(data['password'])
          # Return success message with user details
          halt 200, { user_id: user.id, username: user.name }.to_json
          session[:user_id] = user.id
          puts session[:user_id]
  
        else
          # Return error message
          halt 401, { error: 'Invalid email or password' }.to_json
        end
      end
      
      get '/users/logout' do
      
        if session[:user_id]
          # Remove user id from session
        session.clear
        halt 200, { message: 'User logged out successfully' }.to_json
        else 
          {error: 'Please log in'}
          halt 403
        end      
      end
        
  end