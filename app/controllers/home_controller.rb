class HomeController < ApplicationController
  skip_before_action :check_logged_in, only: :index

  layout "landing_page"

  def index
  end
end
