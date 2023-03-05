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