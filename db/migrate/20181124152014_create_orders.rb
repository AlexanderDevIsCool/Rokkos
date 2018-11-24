class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :fullname
      t.string :city
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
