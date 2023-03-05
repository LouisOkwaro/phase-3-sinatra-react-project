# # app.rb

# require 'sinatra'
# # require 'sinatra/json'
# require 'bcrypt'

class ApplicationController < Sinatra::Base

  # # Set up a session secret for secure cookies
  # set :session_secret, 'super secret'
  
  # # Define a helper method to check if a user is logged in
  # helpers do
  #   def logged_in?
  #     session[:user_id]
  #   end
  # end
  
  # # Define a root route to redirect to the login page
  # get '/' do
  #   redirect '/login'
  # end
  
  # # Define a login page
  # get '/login' do
  #   erb :login
  # end
  
  # # Handle a login request
  # post '/login' do
  #   username = params[:username]
  #   password = params[:password]
    
  #   # Find the user by username
  #   user = User.find_by(username: username)
    
  #   # Check if the user exists and the password is correct
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     # Log in the user and redirect to the dashboard
  #     session[:user_id] = user.id
  #     redirect '/dashboard'
  #   else
  #     # Display an error message and redirect back to the login page
  #     flash[:error] = 'Invalid username or password'
  #     redirect '/login'
  #   end
  # end
  
  # # Define a logout route
  # get '/logout' do
  #   # Log out the user and redirect to the login page
  #   session.clear
  #   redirect '/login'
  # end
  
  # # Define a dashboard route
  # get '/dashboard' do
  #   # Check if the user is logged in
  #   redirect '/login' unless logged_in?
    
  #   # Get the current user's projects and skills
  #   user = User.find(session[:user_id])
  #   projects = user.projects
  #   skills = user.skills
    
  #   # Render the dashboard template with the user's projects and skills
  # #   erb :dashboard, locals: { projects: projects, skills: skills }
  # end
  
  # # Handle a new project request
  # post '/projects/new' do
  #   # Check if the user is logged in
  #   redirect '/login' unless logged_in?
    
  #   # Get the project data from the request parameters
  #   title = params[:title]
  #   description = params[:description]
    
  #   # Create a new project for the current user
  #   user = User.find(session[:user_id])
  #   project = user.projects.create(title: title, description: description)
    
  #   # Return the new project data as JSON
  # #   json project
  # end
  
  # # Handle an update project request
  # put '/projects/:id' do
  #   # Check if the user is logged in
  #   redirect '/login' unless logged_in?
    
  #   # Get the project and new data from the request parameters
  #   project = Project.find(params[:id])
  #   title = params[:title]
  #   description = params[:description]
    
  #   # Update the project data
  #   project.update(title: title, description: description)
    
  #   # Return the updated project data as JSON
  # #   json project
  # end
  
  # # Handle a delete project request
  # delete '/projects/:id' do
  #   # Check if the user is logged in
  #   redirect '/login' unless logged_in?
    
  #   # Find the project and delete it
  #   project = Project.find(params[:id])
  #   project.destroy
    
  #   # Return a success message as JSON
  # #   json message: 'Project deleted successfully'
  # end
  
  # # Handle a new skill request
  # post '/skills/new' do
  #   # Check if the user is logged in
  #   redirect '/login' unless logged_in?
    
  #   # Get the skill data from the request parameters
  #   name = params[:name]
  #   level = params[:level]
    
  # end
  end
  