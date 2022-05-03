class ApplicationController < ActionController::Base

  def author_session
    if session[:admin] == nil
      flash[:notice] = "権限がありません"
      redirect_to "/"
    end
  end

  private

  def session_check
    if session[:admin] != "licht"
      session[:admin] = nil
      session[:admin_id] = nil
    end
  end

end
