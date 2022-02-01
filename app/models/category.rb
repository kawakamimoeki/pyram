class Type < ApplicationRecord
  has_many :payments
  has_many :budgets
end
