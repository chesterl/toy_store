class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    toy = Toy.find(order_params[:toy_id])
    @order = current_user.orders.build(toy: toy, seller: toy.seller)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "You have successfuly purchased the toy!" }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:toy_id)
    end
end
