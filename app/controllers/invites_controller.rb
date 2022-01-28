class InvitesController < ApplicationController
  skip_before_action :check_logged_in, only: :show

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create(
      inviter: current_user.email,
      invitee: invite_params[:invitee],
      key: SecureRandom.base64(13),
      token: SecureRandom.base64(13),
      book_id: current_book.id
    )
    @invite_url = invite_url(@invite, key: @invite.key, token: @invite.token)
  end

  def show
    @invite = Invite.find_by(
      key: params[:key],
      token: params[:token]
    )

    unless @invite
      flash[:notice] = "招待状が無効だったようです...URLを再確認してください。"
      redirect_to root_path
      return
    end

    if current_user
      unless @invite.invitee == current_user.email
        flash[:notice] = "あなたへの招待状ではありませんでした..."
        redirect_to root_path
        return
      end

      @invite.book.users << current_user
      open_book @invite.book
      flash[:notice] = "招待状を受け取りました。#{@invite.book.name} へようこそ！"
      redirect_to book_path(current_book)
    else
      session[:invite_key] = @invite.key
      redirect_to "/auth/google_oauth2", method: :post
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:invitee, :book_id)
  end
end
