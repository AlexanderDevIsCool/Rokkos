class AddRatingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :p_rating, :integer, default: 0
  end
end
