class AddLogoToRecruiters < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :logo, :text
  end
end
