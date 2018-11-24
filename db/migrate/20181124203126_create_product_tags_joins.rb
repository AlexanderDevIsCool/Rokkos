class CreateProductTagsJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tags_joins do |t|
      t.integer :product_id, index: true
      t.integer :tag_id, index: true
      t.timestamps
    end
  end
end
