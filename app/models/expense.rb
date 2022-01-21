class Expense < ApplicationRecord
  belongs_to :category

  class << self
    def total(book_id: nil, category_id: nil, current: Date.today)
      (1..current.day).to_a.map do |day|
        if category_id
          sum_to_month_date(
              book_id: book_id,
              day: Date.new(current.year, current.month, day),
              category_id: category_id
            )
        else
          sum_to_month_date(
            book_id: book_id,
            day: Date.new(Date.today.year, Date.today.month, day)
          )
        end
      end
    end

    def sum_to_month_date(book_id: nil, day: Date.today, category_id: nil)
      if category_id
        Expense.where(
          book_id: book_id,
          category_id: category_id,
          date: day.at_beginning_of_month..day).sum(:amount)
      else
        Expense.where(
          book_id: book_id,
          date: day.at_beginning_of_month..day).sum(:amount)
      end
    end
  end
end
