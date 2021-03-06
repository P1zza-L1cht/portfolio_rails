class ApplicationController < ActionController::Base
  before_action :admin_exist
  
  def author_session
    if session[:admin_user] == nil
      flash[:notice] = "権限がありません"
      redirect_to "/"
    end
  end

  private

  def session_check
    if session[:admin_user] != "licht"
      session[:admin_user] = nil
      session[:admin_id] = nil
    end
  end

  def admin_exist
    if session[:admin_user]
      @admin_exist = "exist"
    else
      @admin_exist = nil
    end
  end

end
