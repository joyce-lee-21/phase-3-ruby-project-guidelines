class CreateJobSeekers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_seekers do |t|
      t.string :name
      t.text :location
    end
  end
end
