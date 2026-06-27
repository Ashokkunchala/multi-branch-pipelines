require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :port, 4567

get '/' do
  content_type :json
  { service: 'ruby-sinatra', status: 'running' }.to_json
end

get '/health' do
  content_type :json
  { status: 'healthy' }.to_json
end
