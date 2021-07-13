class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.integer :profile_id
      t.string :name
      t.integer :level
    end
  end
end
