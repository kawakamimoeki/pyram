class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params.merge(book_id: params[:book_id]))
    redirect_to book_tags_path(params[:book_id])
  end

  def show
    @book = Book.find(params[:book_id])
    @tag = Tag.find(params[:id])
    @current = params[:current] ? Date.parse(params[:current]) : Date.today
    payments = @book.payments.where(date: @current.beginning_of_month..@current.end_of_month, tag_id: @tag.id).order(date: :desc)
    @payments_by_date = payments.group_by { |payment| payment.date.strftime('%Y/%m/%d') }
    session[:current] = @current
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.update(params[:id], tag_params)
    redirect_to book_tags_path(params[:book_id])
  end

  def index
    @tags = Tag.where(book_id: params[:book_id])
  end

  def delete
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
