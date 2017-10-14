class SellersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller, only: [:show, :edit, :update]

  def show
  end

  def new
    redirect :back if current_user.is_a_seller?

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
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:name, :user_id)
    end
end
