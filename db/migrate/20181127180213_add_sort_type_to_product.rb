class AddSortTypeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sort_type, :string
  end
end
