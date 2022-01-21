class UsersController < ApplicationController
  protect_from_forgery :except => [:destroy]

  def setting
    @user = User.find(params[:id])
    unless @user == current_user
       redirect_to root_path
       return
    end
    @books = current_user.books
  end

  def destroy
    @user = User.find(params[:id])
    unless @user == current_user
       redirect_to root_path
       return
    end
    @user.destroy
    session[:book_id] = nil
    flash[:notice] = "ありがとうございました👋"
    redirect_to root_path
  end
end
