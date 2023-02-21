class WhiteLabelAppPaymentDetail < ApplicationRecord
	belongs_to :white_label_app

  	after_save :set_remaining_amount
  	after_save :set_plan_end_date

  	# User.where("created_at > ? AND created_at < ?", DateTime.parse("05/12/2022"), DateTime.parse("06/12/2022"))
	def set_remaining_amount
		final_amount = white_label_app.final_amount.to_i
		total_paid_amount = white_label_app.white_label_app_payment_details.pluck(:paid_amount).map(&:to_i).reduce(:+)
		remaining_amount = final_amount - total_paid_amount
		self.update_column(:remaining_amount, remaining_amount)
		self.white_label_app.update_column(:remaining_amount, remaining_amount)
	end

	def set_plan_end_date
		plan_end_date = white_label_app.plan_start_date + 365.days
		self.update_column(:plan_end_date, plan_end_date)
	end

	def remaining_amount_html
		if (white_label_app.plan_start_date + 365.days).to_date <= Date.today && remaining_amount.to_i != 0
			"<span class='text-danger'>#{remaining_amount}</span>".html_safe
		else
			"<span  class=''>#{remaining_amount}</span>".html_safe
		end
	end
end
