class HomeController < ApplicationController
  def top
    works = Work.all.order(created_at: :desc)
    @three_works = works.first(3)
  end

  def collection
    @works = Work.all.order(created_at: :desc)
  end
end
