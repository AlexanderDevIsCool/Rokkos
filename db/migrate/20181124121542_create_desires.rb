class CreateDesires < ActiveRecord::Migration[5.2]
  def change
    create_table :desires do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.datetime :created_at
      t.timestamps
    end
  end
end
