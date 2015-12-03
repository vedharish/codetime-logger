require 'json'
require 'date'

class MainController < ApplicationController
  def log_heartbeat
    Heartbeat.new
    log_data = JSON.parse(request.body.read)
    log_time = DateTime.strptime(log_data["time"].to_s, '%s')
    beat = Heartbeat.new(log_time: log_time, log_data: log_data)
    beat.save()
    render :json => {}
  end

  def get_heartbeat_logs
    @heartbeats = Heartbeat.all
    puts @heartbeats.inspect
    render template: :get_heartbeat_logs
  end
end
