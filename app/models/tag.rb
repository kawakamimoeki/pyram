class Tag < ApplicationRecord
  belongs_to :book
  has_many :payments

  def expenses_in_month(current: Date.today)
    Expense.joins(:payment).where(
      'payment.date' => current.beginning_of_month..current.end_of_month,
      'payment.tag_id' => id
    )
  end
end
