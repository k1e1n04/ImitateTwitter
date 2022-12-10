class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      t.references :reviewing, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
