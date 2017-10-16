class DashboardController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    redirect_to toys_path if user_signed_in?
  end
end
