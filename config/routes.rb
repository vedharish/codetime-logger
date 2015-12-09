CodetimeLogger::Application.routes.draw do
  root 'main#not_found'
  post '/heartbeats' => 'main#log_heartbeat'
  get '/heartbeat_log' => 'main#get_heartbeat_logs'
  get '/logged_today' => 'main#total_time_today'
end

