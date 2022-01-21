class Budget < ApplicationRecord
  belongs_to :category

  def all
    daily + monthly
  end
end
