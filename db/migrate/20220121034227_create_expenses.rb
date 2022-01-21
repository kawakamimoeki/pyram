class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.integer :amount
      t.date :date
      t.string :memo

      t.timestamps
    end
  end
end
