class SellersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller, only: [:show, :edit, :update]

  def new
    if current_user.is_a_seller?
      flash[:error] = "You're already a seller"
      return redirect_to root_path
    end

    @seller = Seller.new
  end

  def edit
  end

  def create
    @seller = current_user.build_seller(seller_params)

    respond_to do |format|
      if @seller.save
        format.html { redirect_to root_path, notice: "Congrats! You can now start selling toys!" }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to @seller, notice: 'Seller was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_seller
      @seller = Seller.find(params[:id])
    end

    def seller_params
      params.require(:seller).permit(:name, :user_id)
    end
end
