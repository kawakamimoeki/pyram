# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  def initialize(book:, category: nil, current: Date.today)
    @book = book
    @category = category
    @current = current
  end

  def color
    @category ? @category.color : Category::COLORS[:default]
  end

  def expenses_in_month
    @book.expenses_in_month(current: @current, category_id: @category&.id).sum(:amount)
  end

  def sum_budgets
    @book.sum_budgets(category_id: @category&.id)
  end

  def days
    (1..@current.end_of_month.day).to_a
  end

  def expense_stack
    @book.expense_stack(current: @current, category_id: @category&.id)
  end

  def budget_stack
    @book.budget_stack(current: @current, category_id: @category&.id)
  end
end
