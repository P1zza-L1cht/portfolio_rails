class HomeController < ApplicationController
  def top
    works = Work.all.order(id: :desc)
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
    I18n.locale = :en
    redirect_to request.referer
  end
end
