class Category < ApplicationRecord
  has_many :expenses
  has_many :budgets

  COLORS = {
    '必要' => '#ec4899',
    '便利' => '#10b981',
    '楽しむ' => '#0ea5e9',
    :default => '#4b5563'
  }

  def color
    COLORS[name]
  end
end
