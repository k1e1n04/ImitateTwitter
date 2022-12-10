class CreateHellos < ActiveRecord::Migration[6.0]
  def change
    create_table :hellos do |t|
      t.text :body

      t.timestamps
    end
  end
end
