class RemoveSortTypeFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :sort_type, :string
  end
end
