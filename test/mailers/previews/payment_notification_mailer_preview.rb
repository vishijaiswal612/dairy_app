# Preview all emails at http://localhost:3000/rails/mailers/payment_notification_mailer
class PaymentNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_notification_mailer/pending_payment_notification
  def pending_payment_notification
    PaymentNotificationMailer.pending_payment_notification
  end

end
