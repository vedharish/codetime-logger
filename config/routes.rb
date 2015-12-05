CodetimeLogger::Application.routes.draw do
  root 'main#not_found'
  post '/heartbeats' => 'main#log_heartbeat'
  get '/heartbeat_log' => 'main#get_heartbeat_logs'
end

