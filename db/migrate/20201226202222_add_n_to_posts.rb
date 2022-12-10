class AddNToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :n, :string
  end
end
