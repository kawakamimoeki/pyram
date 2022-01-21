module SessionsHelper
  def current_user
    return unless (user_id = session[:user_id])

    @current_user ||= User.find_by(id: user_id)
  end

  def current_book
    @current_book ||= Book.find_by(id: session[:book_id])
  end

  def open_book(book)
    session[:book_id] = book.id
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
