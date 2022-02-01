# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  include ApplicationHelper
  
  def initialize(book:, type: nil, current: Date.today)
    @book = book
    @type = type
    @current = current
  end

  def color
    @type ? type_color(@type.slug) : type_color(:all)
  end

  def expenses_in_month
    @book.expenses_in_month(current: @current, type_id: @type&.id).sum(:amount)
  end

  def sum_budgets
    @book.sum_budgets(type_id: @type&.id)
  end

  def days
    (1..@current.end_of_month.day).to_a
  end

  def expense_stack
    @book.expense_stack(current: @current, type_id: @type&.id)
  end

  def budget_stack
    @book.budget_stack(current: @current, type_id: @type&.id)
  end
end
