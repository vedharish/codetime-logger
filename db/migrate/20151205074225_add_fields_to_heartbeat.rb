class AddFieldsToHeartbeat < ActiveRecord::Migration
  def change
    add_column :heartbeats, :language, :string do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.language = log_data.delete("language") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end

    add_column :heartbeats, :is_write, :bool do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.is_write = log_data.delete("is_write") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end

    add_column :heartbeats, :num_lines, :int do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.num_lines = log_data.delete("lines") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end

    add_column :heartbeats, :entity, :string do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.entity = log_data.delete("entity") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end

    add_column :heartbeats, :project, :string do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.project = log_data.delete("project") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end

    add_column :heartbeats, :branch, :string do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.branch = log_data.delete("branch") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end

    add_column :heartbeats, :log_type, :string do
      Heartbeat.find_each do |heartbeat|
        log_data = JSON.parse(heartbeat.log_data)
        heartbeat.log_type = log_data.delete("log_type") || nil
        heartbeat.log_data = log_data.to_json
        heartbeat.save!
      end
    end
  end
end
