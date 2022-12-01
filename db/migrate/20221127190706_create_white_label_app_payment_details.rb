class CreateWhiteLabelAppPaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :white_label_app_payment_details do |t|
      t.references :white_label_app, foreign_key: true
      t.string :paid_amount
      t.string :remaining_amount

      t.timestamps
    end
  end
end
