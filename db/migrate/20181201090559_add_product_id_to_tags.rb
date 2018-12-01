class AddProductIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :product_id, :integer
    add_index :tags, :product_id
  end
end
