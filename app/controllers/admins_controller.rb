class AdminsController < ApplicationController
  def admin_form
  end

  def sign_in
    @admin = Admin.find_by(mail: params[:mail])
    respond_to do |format|
      if @admin && @admin.authenticate(params[:password])
        session[:admin] = @admin.name
        session[:admin_id] = @admin.id
        format.html {redirect_to collection_path, notice: "ログインしました"}
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        format.html {render :admin_form, status: :unprocessable_entity}
      end
    end
  end

  def sign_out
    session[:admin] = nil
    session[:admin_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/login"
  end
end
