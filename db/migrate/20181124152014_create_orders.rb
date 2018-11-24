class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :full_name
      t.string :city
      t.string :mobile
      t.string :email
      t.string :order_type
      t.datetime :created_at

      t.timestamps
    end
  end
end
