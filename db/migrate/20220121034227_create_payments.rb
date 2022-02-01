class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.date :date
      t.string :memo
      t.boolean :monthly, default: false

      t.timestamps
    end
  end
end
