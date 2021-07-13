class AddEmailPasswordUsernameToJobSeeker < ActiveRecord::Migration[5.2]
  def change
    add_column :job_seekers, :username, :string
    add_column :job_seekers, :password, :string
    add_column :job_seekers, :email, :string
  end
end
