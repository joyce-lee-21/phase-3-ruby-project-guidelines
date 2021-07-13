class CreateAddEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :add_events do |t|
      t.integer :event_id
      t.integer :seeker_id
    end
  end
end
