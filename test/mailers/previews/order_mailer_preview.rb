# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_summary
  def order_summary
		order = Order.first
		OrderMailer.order_summary(order)
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_admin_notification
  def order_admin_notification
    order = Order.last
    OrderMailer.order_admin_notification(order)
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_shipped
  def order_shipped
		order = Order.first
		OrderMailer.order_shipped(order)
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_cancellation
  def order_cancellation
		order = Order.first
		OrderMailer.order_cancellation(order)
  end

end
