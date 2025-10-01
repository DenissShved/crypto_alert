class CreateAlerts < ActiveRecord::Migration[8.0]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :coin
      t.string :condition
      t.decimal :target_price

      t.timestamps
    end
  end
end
