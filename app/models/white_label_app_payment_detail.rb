class WhiteLabelAppPaymentDetail < ApplicationRecord
	belongs_to :white_label_app

	# def notification_send
	# 	Date.today - plan_start_date > 358 days
    #     # @white_label_app_payment_detail = WhiteLabelAppPaymentDetail.all
    #     # UserMailer.notification_send(@white_label_app_payment_detail).deliver  
	#   	# PaymentNotificationMailer.pending_payment_notification.deliver_now
  	# end

  	after_create :set_remaining_amount

	def set_remaining_amount
		final_amount = white_label_app.final_amount.to_i
		total_paid_amount = white_label_app.white_label_app_payment_details.pluck(:paid_amount).map(&:to_i).reduce(:+)
		remaining_amount = final_amount - total_paid_amount
		self.update(remaining_amount: remaining_amount)
	end
end
