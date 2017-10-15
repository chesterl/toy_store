class AdminController < ApplicationController

  def crazy_things
  end

  def do_crazy_things
    random_number = (User.all.pluck(:id)).sample
    @user = User.find(random_number)
    authorize! :manage, @user

    flash[:notice] = "You have deleted a random user... Jk. The crazy coder commented the code out"
    redirect_to root_path
  end

end
