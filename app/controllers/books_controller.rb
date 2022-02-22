class BooksController < ApplicationController
  protect_from_forgery :except => [:destroy]

  def show
    @book = Book.find(params[:id])
    @current = params[:month] ? Date.strptime(params[:month], "%Y-%m").end_of_month : Date.today
    payments = @book.payments.where(date: @current.beginning_of_month..@current.end_of_month).order(date: :desc)
    @payments_by_date = payments.group_by { |payment| payment.date.strftime('%Y/%m/%d') }
    session[:current] = @current
  end

  def setting
    @book = Book.find(params[:id])
    @invite = Invite.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to setting_user_path(current_user)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.users << current_user
    @book.save
    open_book @book

    Type.all.each do |type|
      Budget.create(book_id: @book.id, type_id: type.id)
    end

    flash[:notice] = "#{@book.name} を作成しました💪 予算をたててみましょう！"
    redirect_to book_edit_budget_path(@book)
  end

  def switch
    @book = Book.find(params[:id])
    if current_user.books.include?(@book)
      open_book @book
    end
    redirect_to book_path(@book)
  end

  private
  def book_params
    params.require(:book).permit(:name)
  end
end
