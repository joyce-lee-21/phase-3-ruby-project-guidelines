class AddImageToJobSeekers < ActiveRecord::Migration[5.2]
  def change
    add_column :job_seekers, :image, :text
  end
end
