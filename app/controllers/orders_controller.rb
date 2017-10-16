class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders.includes(:toy)
  end

  def sales
    @orders = current_seller.orders
  end

  def show
  end

  def create
    toy = Toy.find(order_params[:toy_id])

    @amount = toy.price_in_cents

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
    Order.transaction do
      @order = current_user.orders.build(toy: toy, seller: toy.seller)

      respond_to do |format|
        if toy.sell! && @order.save
          format.html { redirect_to orders_path, notice: "You have successfuly purchased the toy!" }
        else
          format.html { render :new }
        end
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
