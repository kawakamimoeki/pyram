class AddRepeatMonthToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :repeat_month, :integer, default: 1
  end
end
