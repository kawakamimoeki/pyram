class AddDefaultValueToAmount < ActiveRecord::Migration[7.0]
  def change
    change_column :expenses, :amount, :integer, default: 0
  end
end
