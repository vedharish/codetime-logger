CodetimeLogger::Application.routes.draw do
  root 'main#not_found'
  post '/heartbeats' => 'main#log_heartbeat'
  get '/heartbeat_log' => 'main#get_heartbeat_logs'
  get '/day_logs(/:year/:month/:day)' => 'main#day_logs', constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
  get '/day_time(/:year/:month/:day)' => 'main#day_time', constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }
end

