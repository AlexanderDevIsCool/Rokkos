class AddUserIdToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :user_id, :integer
    add_index :ratings, :user_id
  end
end
