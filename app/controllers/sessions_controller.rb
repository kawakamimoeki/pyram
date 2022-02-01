class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: :create
  protect_from_forgery :except => [:destroy]
  
  def create
    if (user = User.find_or_create_from_auth_hash(auth_hash))
      log_in user
    end
    if current_book
      redirect_to book_path(current_book)
      return
    elsif session[:invite_key].present?
      @invite = Invite.find_by(key: session[:invite_key])
      @invite.book.users << current_user unless @invite.book.users.include?(current_user)
      open_book @invite.book
      flash[:notice] = "招待状を受け取りました。#{@invite.book.name} へようこそ！"
      redirect_to book_path(current_book)
      return
    elsif user.books.present?
      open_book(user.books.first)
      redirect_to book_path(current_book)
      return
    else
      flash[:notice] = "Kakbo へようこそ！新しい家計簿を作成しましょう。"
      redirect_to new_book_path
    end
  end
   
  def destroy
    log_out
    flash[:notice] = "ログアウトしました。またお越しください！"
    redirect_to book_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
