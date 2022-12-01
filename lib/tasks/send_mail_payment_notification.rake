require 'rake'
namespace :notification do
  desc 'send notification to admin on mail'
  task :send_mail => :environment do
    # call Listing method to send mail
    # WhiteLabelAppPaymentDetail.notification_send
    # plan_end_date = plan_start_date + (365 - 7).days
    # puts '#{plan_end_date}'
    # WhiteLabelApp.joins("left join white_label_app_payment_details t on t.white_label_app_id = white_label_apps.id AND t.id  = (SELECT MAX(id) from white_label_app_payment_details where  white_label_app_payment_details.white_label_app_id = t.white_label_app_id)").where("plan_start_date = ? AND t.remaining_amount > ?", plan_start_date, 0).each do |white_label_app|
    # end
    WhiteLabelApp.notification_send
  end
end