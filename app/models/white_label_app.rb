class WhiteLabelApp < ApplicationRecord
	enum app_launched: [:false, :true]
	enum app_type: [ :android_IOS, :android, :IOS ]
	enum number_of_customer_app_plan: [ 100, 200, 300, 500, 1000 ]

	enum deal_status: [ :pending, :done, :not_interested]
	enum payment_paid_details: [ :cash, :upi_payment, :draft ]

	belongs_to :milkman
	has_many :white_label_app_payment_details, dependent: :destroy

	validates :final_amount, presence: true
	validates :plan_start_date, presence: true

	after_save :create_base_64

	after_create :every_year_increase_final_amount

	def every_year_increase_final_amount
		# FinalAmountJob.set(wait_until: Time.zone.today.end_of_day).perform_later
		FinalAmountJob.set(wait_until: (plan_start_date + 365.days).end_of_day).perform_later(self)
		# FinalAmountJob.perform_now(self)
	end

	def create_base_64
	    android_store_password_encr = Base64.encode64(android_store_password.to_s)
		self.update_column(:android_store_password, android_store_password_encr)
	    apple_store_password_encr = Base64.encode64(apple_store_password.to_s)
		self.update_column(:apple_store_password, apple_store_password_encr)
		# a = 1
	    # b = Base64.encode64(a.to_s)
	    # # for decoding
	    # c = Base64.decode64(b)
	end

	# def self.every_year_increase_final_amount
	# 	WhiteLabelApp.all.each do |white_label_app|
	# 		plan_start_date = white_label_app.plan_start_date
	# 		plan_end_date = plan_start_date + 365.days
	# 		if Date.today == (plan_start_date + 365.days).to_date
	# 			new_plan_start_date = plan_end_date + 1.days
	# 			self.update(plan_start_date: new_plan_start_date)
	# 			new_final_amount = white_label_app.final_amount.to_i + (white_label_app.final_amount.to_i * 10)/100
	# 			self.update(final_amount: new_final_amount)
	# 		end
	# 	end
	# end

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