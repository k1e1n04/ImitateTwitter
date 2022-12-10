class AddHomeImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :home_image, :string
  end
end
