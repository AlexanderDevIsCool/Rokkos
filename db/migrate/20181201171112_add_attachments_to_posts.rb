class AddAttachmentsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :attachments, :string
  end
end
