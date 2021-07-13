class CreateRecruiters < ActiveRecord::Migration[5.2]
  def change
    create_table :recruiters do |t|
      t.string :name
      t.text :company_name
      t.text :location
    end
  end
end
