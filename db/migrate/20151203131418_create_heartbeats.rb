class CreateHeartbeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|

      t.timestamps null: false
    end
  end
end
