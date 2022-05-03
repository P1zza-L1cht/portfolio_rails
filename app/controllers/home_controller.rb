class HomeController < ApplicationController
  def top
    works = Work.all.order(created_at: :desc)
    @three_works = works.first(3)
  end

  def collection
    @works = Work.all.reverse_order.page(params[:page]).per(10)
  end

  def to_jp
    I18n.lacale = :ja
    redirect_to request.referer
  end

  def to_en
    I18n.locale = :end
    redirect_to request.referer
  end
end
