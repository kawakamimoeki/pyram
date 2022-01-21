class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets, id: :uuid do |t|
      t.integer :daily, default: 0
      t.integer :monthly, default: 0
      t.references :book, foreign_key: true, type: :uuid
      t.references :category, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
