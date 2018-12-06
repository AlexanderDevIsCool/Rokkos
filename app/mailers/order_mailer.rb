class OrderMailer < ApplicationMailer
  def create( order, user, product)
    @user = user
    @order = order
    @product = product
    mail to: user.email, subject: "create"
  end
end
