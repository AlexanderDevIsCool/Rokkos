class AddQuantityAndPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :quantity, :string
    add_column :orders, :order_price, :string
  end
end
