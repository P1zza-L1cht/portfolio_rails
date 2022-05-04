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
    @work = Work.new(user_id: session[:admin_id])
    @work.save
      if params[:image]
        @work.image_name = "#{@work.id}.jpg"
        image = params[:image]
        file.binwrite("public/work_images/#{@work.image_name}, image.read")
      else
        @work.destroy
        render("works/new")
      end

      if @work.save
        flash[:notice] = "画像をアップロードしました"
        redirect_to("/collection")
      else
        render("works/new")
      end
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def update
    @work = Work.find_by(id: params[:id])
    image = params[:image]
    file.binwrite("public/work_images/#{@work.image_name}, image.read")
    @work.save
    flash[:notice] = "画像を更新しました"
    redirect_to("/collection")
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    @work.destroy

    respond_to do |format|
      format.html {redirect_to collection_path, notice: "削除に成功しました", status: :see_other } 
    end
  end
end