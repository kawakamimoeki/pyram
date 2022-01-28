class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  layout "landing_page"

  def index
    redirect_to book_path(current_book) if current_book
  end
end
