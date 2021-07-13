class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :recruiter_id
      t.datetime :event_date
      t.text :location
      t.text :description
    end
  end
end
