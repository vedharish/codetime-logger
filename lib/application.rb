require 'sinatra/base'
require 'json'
require 'active_record'

LOG_HEARTBEATS = 'heartbeatz.log'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

class Application < Sinatra::Base
  post '/heartbeats' do
    conn = PGconn.open(ENV['DATABASE_URL'])
    conn.exec('INSERT INTO heartbeatz value ()')
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
