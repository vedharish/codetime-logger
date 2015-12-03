class AddLogDataToHeartbeats < ActiveRecord::Migration
  def change
    add_column :heartbeats, :log_data, :text
  end
end
