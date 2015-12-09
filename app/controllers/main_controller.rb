require 'json'
require 'date'

class MainController < ApplicationController
  def log_heartbeat
    Heartbeat.new
    log_data = JSON.parse(request.body.read)
    log_time = DateTime.strptime(log_data["time"].to_s, '%s')
    language = log_data.delete("language") || nil
    is_write = log_data.delete("is_write") || false
    num_lines = log_data.delete("lines") || 0
    entity = log_data.delete("entity") || nil
    project = log_data.delete("project") || nil
    branch = log_data.delete("branch") || nil
    log_type = log_data.delete("type") || nil
    beat = Heartbeat.new(log_time: log_time, log_data: log_data.to_json,
                        language: language, is_write: is_write,
                        num_lines: num_lines, entity: entity,
                        project: project, branch: branch,
                        log_type: log_type)
    beat.save()
    render :json => {}
  end

  def get_heartbeat_logs
    @heartbeats = Heartbeat.all
    render template: :get_heartbeat_logs
  end

  def not_found
    render :json => {:value => 'Wrong Path'}
  end

  def day_logs
    @heartbeats = Heartbeat.where(log_time: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))
    render template: :get_heartbeat_logs
  end

  def day_time
    @heartbeats = Heartbeat.where(log_time: (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)).sort_by { |beat| beat.log_time }
    total_time = (@heartbeats.first.log_time - @heartbeats.first.time)
    render json: { total_time: total_time }
  end
end
