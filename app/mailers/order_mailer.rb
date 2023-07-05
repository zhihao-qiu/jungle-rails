class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email
    @order = params[:order]
    mail(to: @order.email, subject: 'Receipt for order# ' + @order.id.to_s)
  end
end
