class BudgetsController < ApplicationController
  def edit
    @book = Book.find(params[:book_id])
    @budgets = Budget.where(book_id: @book.id)
  end

  def update
    Category.all.each do |category|
      budget = Budget.find_by(category_id: category.id, book_id: current_book.id)
      budget.update(
        daily: params[:budget][category.id.to_s][:daily],
        monthly: params[:budget][category.id.to_s][:monthly]
      )
    end

    flash[:notice] = "予算を設定しました🤞"

    redirect_to book_path(current_book)
  end
end
