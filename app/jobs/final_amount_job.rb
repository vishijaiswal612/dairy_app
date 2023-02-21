class FinalAmountJob < ApplicationJob
queue_as :default

  def perform(white_label_app)
      amount = white_label_app.final_amount.to_i
      # final_amount = amount + (amount * 10)/100
      final_amount = amount + white_label_app.set_amount_increment
      plan_start_date = Date.today
      plan_end_date = plan_start_date + 365.days
      self.update(final_amount: final_amount)
      self.update(plan_start_date: plan_start_date)
      FinalAmountJob.set(wait_until: Date.today + 365.days).perform_later(white_label_app)
  end
end