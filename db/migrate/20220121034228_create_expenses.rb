class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses, id: :uuid do |t|
      t.integer :amount
      t.references :payment, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
