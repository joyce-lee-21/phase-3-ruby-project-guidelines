class AddEmailPasswordUsernameToRecruiter < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :username, :string
    add_column :recruiters, :password, :string
    add_column :recruiters, :email, :string
  end
end
