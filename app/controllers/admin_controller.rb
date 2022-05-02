class AdminController < ApplicationController

  def admin_form
  end

  def sign_in
    @admin = Admin.find_by(mail: params[:email])
    if @admin && @admin.authenticate(params[:password])
      session[:admin] = @admin.name
      session[:admin_id] = @admin.id
      flash[:notice] = "ログインしました"
      redirect_to("/collection")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render("admins/admin_form")
    end
  end

  def sign_out
    session[:admin] = nil
    session[:admin_id] = nil
    flash[:notice] = "ログインしました"
    redirect_to "/login"
  end
end
