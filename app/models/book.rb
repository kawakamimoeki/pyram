class Book < ApplicationRecord
  has_and_belongs_to_many :users, optional: true, depandant: :destroy
  has_many :budgets, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :invites, dependent: :destroy

  def expenses_in_month(current: Date.today, category_id: nil)
    e = expenses.where(date: current.beginning_of_month..current.end_of_month)
    e = e.where(category_id: category_id) if category_id
    e
  end

  def sum_budgets(category_id: nil)
    b = budgets
    b = b.where(category_id: category_id) if category_id
    b.sum(:daily) + b.sum(:monthly)
  end

  def expense_stack(current: Date.today, category_id: nil)
    stack = 0
    (1..current.day).to_a.map do |day|
      e = expenses.where(date: Date.new(current.year, current.month, day), monthly: false)
      e = e.where(category_id: category_id) if category_id
      stack += e.sum(:amount)
      stack
    end
  end

  def budget_stack(current: Date.today, category_id: nil)
    (1..current.end_of_month.day).to_a.map do |day|
      b = budgets
      b = b.where(category_id: category_id) if category_id
      day * (b.sum(:daily)) / current.end_of_month.day
    end
  end
end
