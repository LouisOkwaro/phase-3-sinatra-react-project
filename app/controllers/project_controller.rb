require 'sinatra/session'

class ProjectController < Sinatra::Base

    enable :sessions
    set :default_content_type, 'application/json'


    # Create a new project with a user_id to help list users projects only
    post '/projects/create' do
        request.body.rewind
        data = JSON.parse(request.body.read)
      
        project = Project.new(
          title: data['title'],
          description: data['description'],
          user_id: data['user_id']
        )
      
        if project.save
          status 201
          project.to_json
        else
          status 403
          { errors: project.errors }.to_json
        end
    end

    # List all the user's projects
    get '/projects/:user_id' do
        project = Project.where(user_id: params[:user_id])

        if project
          project.to_json
        else
          status 403
        end
    end