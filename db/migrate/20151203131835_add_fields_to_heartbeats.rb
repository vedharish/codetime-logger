class AddFieldsToHeartbeats < ActiveRecord::Migration
  def change
    add_column :heartbeats, :log_time, :datetime
  end
end
