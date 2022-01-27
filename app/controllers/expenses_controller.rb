class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_param.merge(book_id: current_book.id))
    redirect_to book_path(current_book)
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.update(expense_param)
    flash[:notice] = '支出の内容を変更しました😎'
    redirect_to book_expenses_path(current_book, category: (session[:category] ? session[:category]['id'] : nil), current: session[:current])
  end

  def index
    @current = Date.parse(params[:current])
    @book = Book.find(params[:book_id])
    expenses = @book.expenses.where(date: @current.beginning_of_month..@current.end_of_month).order(date: :desc)
    @category = Category.find(params[:category]) if params[:category].present?
    expenses = expenses.where(category: params[:category]) if params[:category].present?
    @expenses_sum = expenses.sum(:amount)
    @expenses_by_date = expenses.group_by { |expense| expense.date.strftime('%Y/%m/%d') }
    session[:current] = @current
    session[:category] = @category
  end

  private
  def expense_param
    params.require(:expense).permit(:amount, :date, :monthly, :category_id, :memo)
  end
end
