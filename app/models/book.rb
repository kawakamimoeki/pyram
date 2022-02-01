class Book < ApplicationRecord
  has_and_belongs_to_many :users, optional: true
  has_many :budgets, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :invites, dependent: :destroy

  def expenses_in_month(current: Date.today, type_id: nil)
    e = Expense.joins(:payment).where(
      'payment.date' => current.beginning_of_month..current.end_of_month,
      book_id: id
    )
    e.where(type_id: type_id) if type_id
    e
  end

  def sum_budgets(type_id: nil)
    b = budgets
    b = b.where(type_id: type_id) if type_id
    b.sum(:daily) + b.sum(:monthly)
  end

  def expense_stack(current: Date.today, type_id: nil)
    stack = 0
    (1..current.day).to_a.map do |day|
      e = Expense.joins(:payment).where(
        'payment.date' => Date.new(current.year, current.month, day),
        'payment.book_id' => id,
        'payment.monthly' => false
      )
      e = e.where(type_id: type_id) if type_id
      stack += e.sum(:amount)
      stack
    end
  end

  def budget_stack(current: Date.today, type_id: nil)
    (1..current.end_of_month.day).to_a.map do |day|
      b = budgets
      b = b.where(type_id: type_id) if type_id
      day * (b.sum(:daily)) / current.end_of_month.day
    end
  end
end
