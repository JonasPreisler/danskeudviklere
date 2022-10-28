class HomeController < ApplicationController
  def show
    @developers = Developer.order(created_at: :desc)
  end
end
