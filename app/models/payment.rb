class Payment < ApplicationRecord
  has_many :expenses, dependent: :destroy
  belongs_to :book
  belongs_to :tag

  def required_expense
    expenses.where(type_id: Type.find_by(slug: 'required').id).first
  end

  def affluent_expense
    expenses.where(type_id: Type.find_by(slug: 'affluent').id).first
  end
end
