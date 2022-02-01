class BudgetsController < ApplicationController
  def edit
    @book = Book.find(params[:book_id])
    @budgets = Budget.where(book_id: @book.id)
  end

  def update
    Type.all.each do |type|
      budget = Budget.find_by(type_id: type.id, book_id: current_book.id)
      budget.update(
        daily: params[:budget][type.id.to_s][:daily],
        monthly: params[:budget][type.id.to_s][:monthly]
      )
    end

    flash[:notice] = "予算を設定しました🤞"

    redirect_to book_path(current_book)
  end
end
