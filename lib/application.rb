require 'sinatra/base'
require 'json'

LOG_HEARTBEATS = 'heartbeatz.log'

class Application < Sinatra::Base
  post '/heartbeats' do
    open(LOG_HEARTBEATS, 'a') { |f|
        f.puts request.body.read.to_json
    }
    content_type :json
    { :status => 'OK' }.to_json
  end

  get '/heartbeat_log' do
    send_file LOG_HEARTBEATS, :filename => LOG_HEARTBEATS, :type => 'Application/octet-stream'
  end
end
