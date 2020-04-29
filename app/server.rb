require 'sinatra'

require './app/config/constants.rb'

before do
  content_type 'application/json'
end

get '/get_numbers' do
  return { numbers: Constants::DATABASES[params[:db].to_sym].get_random_numbers }.to_json if params[:db] && Constants::POSSIBLE_DBS.include?(params[:db])
  halt 404, { error: "Invalid parameter db. Possible values: #{Constants::POSSIBLE_DBS}."}.to_json
end