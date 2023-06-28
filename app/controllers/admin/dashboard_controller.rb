class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.basic_auth[:username], password: Rails.configuration.basic_auth[:password]

  def show
    @categories = Category.all.order(id: :asc)
  end
end
