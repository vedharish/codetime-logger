class AddIndexOnLogDate < ActiveRecord::Migration
  def change
    add_index :heartbeats, :log_time
  end
end
