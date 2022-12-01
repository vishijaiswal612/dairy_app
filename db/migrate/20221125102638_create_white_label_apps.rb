class CreateWhiteLabelApps < ActiveRecord::Migration[5.2]
  def change
    create_table :white_label_apps do |t|
      t.references :milkman, foreign_key: true
      t.string :android_store_email
      t.string :android_store_password
      t.string :apple_store_email
      t.string :apple_store_password
      t.string :github_customer_app_branch_name
      t.string :github_business_app_branch_name
      t.string :app_launched
      t.string :app_type

      t.string :total_section_a_amount
      t.string :total_section_b_amount
      t.string :discount
      t.boolean :app_plan_included 
      t.string :number_of_customer_app_plan
      t.string :final_amount

      t.string :agreement_google_drive_url
      t.string :deal_status
      t.string :deal_closed_by
      t.string :deal_payment_google_drive_url
      t.string :cust_android_app_launched_date
      t.datetime :cust_ios_app_launched_date
      t.datetime :business_android_app_launched_date

      t.string :payment_paid_details
      t.datetime :plan_start_date
      t.timestamps
    end
  end
end
