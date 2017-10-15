class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    toy = Toy.find(order_params[:toy_id])

    @amount = (toy.price * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    # TODO: rescue failure if order fails to save
    @order = current_user.orders.build(toy: toy, seller: toy.seller)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "You have successfuly purchased the toy!" }
      else
        format.html { render :new }
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:toy_id)
    end
end
