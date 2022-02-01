class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :book
  belongs_to :payment

  class << self
    def total(book_id: nil, type_id: nil, current: Date.today)
      (1..current.day).to_a.map do |day|
        if type_id
          sum_to_month_date(
              book_id: book_id,
              day: Date.new(current.year, current.month, day),
              type_id: type_id
            )
        else
          sum_to_month_date(
            book_id: book_id,
            day: Date.new(Date.today.year, Date.today.month, day)
          )
        end
      end
    end

    def sum_to_month_date(book_id: nil, day: Date.today, type_id: nil)
      if type_id
        Expense.where(
          book_id: book_id,
          type_id: type_id,
          date: day.at_beginning_of_month..day).sum(:amount)
      else
        Expense.where(
          book_id: book_id,
          date: day.at_beginning_of_month..day).sum(:amount)
      end
    end
  end
end
