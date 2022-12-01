class PaymentNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_notification_mailer.pending_payment_notification.subject
  #
  default from: 'notifications@example.com'

  def pending_payment_notification(white_label_app)
    @greeting = "Hi"
    @milkman_id = white_label_app.milkman_id
    @plan_end_date = (white_label_app.plan_start_date.to_date + 365.days).to_date
    @dairy_name = Milkman.where(id: white_label_app.milkman_id).first.dairy_name
    @user_name = Milkman.where(id: white_label_app.milkman_id).first.user.name
    @remaining_amount = white_label_app.white_label_app_payment_details.pluck(:remaining_amount).map(&:to_i).last
    mail to: "vijay@gemsessence.com", :subject => "Pending Payment Notification"
  end
end
