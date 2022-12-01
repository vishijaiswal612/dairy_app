class WhiteLabelApp < ApplicationRecord
	belongs_to :milkman
	has_many :white_label_app_payment_details, dependent: :destroy

	def self.notification_send
		WhiteLabelApp.all.each do |white_label_app|
			plan_start_date = white_label_app.plan_start_date.to_date
			mail_send_date = (Date.today - plan_start_date).to_i.day
			if white_label_app.white_label_app_payment_details.pluck(:remaining_amount).map(&:to_i).last != 0
				if mail_send_date == 357.days || mail_send_date == 362.days || mail_send_date == 365.days
					@white_label_app = white_label_app
					puts "MAIL SHOULD BE SEND TO ADMIN"
			        PaymentNotificationMailer.pending_payment_notification(@white_label_app).deliver_now
				end	
			end
		end		
	end
end