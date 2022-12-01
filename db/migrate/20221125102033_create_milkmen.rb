class CreateMilkmen < ActiveRecord::Migration[5.2]
  def change
    create_table :milkmen do |t|
      t.string :dairy_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
