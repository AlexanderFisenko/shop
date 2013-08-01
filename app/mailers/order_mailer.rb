class OrderMailer < ActionMailer::Base
  default from: "1alexanderfisenko@gmail.com"

  def notify_admin(order)
    @order = order
    mail(to: "fermerusa@rambler.ru", subject: "New order created")
  end

  def notify_user(order)
    @order = order
    mail(to: order.user_email, subject: "Congratulations!")
  end
end
