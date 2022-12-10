class AddNumberToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :number, :integer
  end
end
