class TypeType < ApplicationRecord
  has_many :categories

  COLORS = {
    '必要' => '#f43f5e',
    '便利' => '#10b981',
    '楽しむ' => '#0ea5e9',
    :default => '#4b5563'
  }

  def color
    COLORS[name]
  end
end
