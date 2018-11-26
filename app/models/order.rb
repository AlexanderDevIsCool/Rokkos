class Order < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }


  def order_create
    OrderMailer.create(self, User.find_by(id: self.user_id),
                            Product.find_by(id: self.product_id)).deliver_now
  end
end
