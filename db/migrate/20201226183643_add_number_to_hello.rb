class AddNumberToHello < ActiveRecord::Migration[6.0]
  def change
    add_column :hellos, :number, :integer
  end
end
