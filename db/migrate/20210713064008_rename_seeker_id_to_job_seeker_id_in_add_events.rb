class RenameSeekerIdToJobSeekerIdInAddEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :add_events, :seeker_id, :job_seeker_id
  end
end
