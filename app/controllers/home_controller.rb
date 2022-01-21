class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  layout "landing_page"

  def index
    @expense = Expense.new
    @sample_book = Book.find_by(name: "Sample Book")
  end
end
