class AdminsController < ApplicationController
  def admin_form
  end

  def sign_in
    @admin = Admin.find_by(secure_params[:mail])
    respond_to do |format|
      if @admin && @admin.authenticate(secure_params[:password])
        session[:admin_user] = @admin.name
        session[:admin_id] = @admin.id
        format.html {redirect_to collection_path, notice: "ログインしました"}
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        format.html {render :admin_form, status: :unprocessable_entity}
      end
    end
  end

  def sign_out
    session.delete(:admin_user)
    session.delete(:admin_id)
    flash[:notice] = "ログアウトしました"
    redirect_to "/login"
  end

private

  def secure_params
    params.require(:session).permit(:mail, :password)
  end

end
