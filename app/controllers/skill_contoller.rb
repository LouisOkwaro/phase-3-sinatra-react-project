require 'sinatra'
require 'sinatra/activerecord'
require_relative '../models/user'
require_relative '../models/skill'


class SkillsController < Sinatra::Base

enable :sessions


get '/skills/:user_id' do
  skill = Skill.where(user_id: params[:user_id])

  if skill
    skill.to_json
  else
    status 403
  end
end

post '/skills/create' do
    if Skill.where(user_id: params[:user_id]).count >= 10
      { error: "You cannot have more than 10 skills" }.to_json
    else
      skill = Skill.new(user_id: params[:user_id], name: params[:name])
      if skill.save
      else
        { error: "Error creating skill" }.to_json
      end
    end
  end
  
  put '/skills/update/:user_id' do
    skill = Skill.where(user_id: params[:user_id])
    name = params[:name]
    if skill.update(name: name)
    else
      status 400
    end
  end