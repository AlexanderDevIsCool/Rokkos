class AddQunatityToDesires < ActiveRecord::Migration[5.2]
  def change
    add_column :desires, :desires_quantity, :string
  end
end
