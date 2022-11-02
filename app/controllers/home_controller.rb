class HomeController < ApplicationController
  def show
    @developers = Developer.visible.order(created_at: :desc).limit(6)
  end
end
