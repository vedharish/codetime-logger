class ChangeStringLogsToJson < ActiveRecord::Migration
  def change
    Heartbeat.find_each do |heartbeat|
      heartbeat.log_data = (eval heartbeat.log_data).to_json
      heartbeat.save!
    end
  end
end
