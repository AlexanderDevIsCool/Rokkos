class OrderMailer < ApplicationMailer
  def create(user, order, product)
    @user = user
    @order = order
    @product = product
    mail to: user.email, subject: "create"
  end
end
