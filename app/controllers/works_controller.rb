class WorksController < ApplicationController
  before_action :session_check
  before_action :author_session

  def new
    @work = Work.new
  end

  def index
    @works = Work.all.reverse_order.page(params[:page]).per(30)
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = session[:admin_id]
    respond_to do |format|
      if @work.save
        format.html {redirect_to works_path, notice: "画像をアップロードしました"}
      else
        @error_message = "保存できませんでした"
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    respond_to do |format|
      if @work.update(work_params)
        format.html {redirect_to works_path, notice: "更新しました"}
      else
        @error_message = "保存できませんでした"
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    @work.destroy
    respond_to do |format|
      format.html {redirect_to works_path, notice: "削除に成功しました", status: :see_other } 
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :link_url, :image, :user_id)
  end

end
