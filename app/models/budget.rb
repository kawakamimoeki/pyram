class Budget < ApplicationRecord
  belongs_to :type

  def all
    daily + monthly
  end
end
