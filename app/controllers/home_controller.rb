class HomeController < ApplicationController
  def top
    works = Work.all.order(id: :desc)
    @three_works = works.first(3)
    @contact = Contact.new
  end

  def collection
    @works = Work.all.reverse_order.page(params[:page]).per(10)
  end

  def thanks
  end

  def send_jp
    contact = Contact.new(sender_params)
    ContactMailer.send_mail(contact).deliver_now
    respond_to do |format|
      format.html {redirect_to thanks_path, notice: "送信しました"}
    end
  end

  def to_jp
    I18n.lacale = :ja
    redirect_to request.referer
  end

  def to_en
    I18n.locale = :en
    redirect_to request.referer
  end

  private

  def sender_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
