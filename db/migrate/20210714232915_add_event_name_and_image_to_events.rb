class AddEventNameAndImageToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
    add_column :events, :image, :text
  end
end
