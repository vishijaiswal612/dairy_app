class CreateWhiteLabelAppPaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :white_label_app_payment_details do |t|
      t.references :white_label_app, foreign_key: true
      t.string :paid_amount
      t.string :remaining_amount
      t.string :paid_in_account
      t.datetime :plan_end_date
      t.datetime :payment_date

      t.timestamps
    end
  end
end
