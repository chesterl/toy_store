class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  #TODO: seller can access index, show, new, create, edit update, destroy
  # user can access show
  #TODO: items for sale
  def index
    @toys = Toy.active.where(nil)

    #TODO: Make search and filter work together
    search_results if search_keywords
    add_filters if filters?
  end

  def show
    @order = Order.new
  end

  def new
    @toy = Toy.new
  end

  def edit
  end

  def create
    @toy = current_seller.toys.build(toy_params)

    respond_to do |format|
      if @toy.save
        format.html { redirect_to @toy, notice: 'Your toy has been listed!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @toy.update(toy_params)
        format.html { redirect_to @toy, notice: 'Listing was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @toy.destroy
    respond_to do |format|
      format.html { redirect_to toys_url, notice: 'Toy was successfully deleted.' }
    end
  end

  private

    def set_toy
      @toy = Toy.find(params[:id])
    end

    def toy_params
      params.require(:toy).permit(:name, :price, :description, :image)
    end

    #TODO: Refactor out search and filtering
    def search_params
      params.permit(:search_terms)
    end

    def search_keywords
      @search_keywords ||= search_params[:search_terms]
    end

    def search_results
      @toys = @toys.name_like(search_keywords).or(@toys.description_contains(search_keywords))
    end

    def filter_results
      params.permit(:min_price, :max_price)
    end

    def filter_options
      @filter_options ||= filter_results
    end

    def add_filters
      @toys = @toys.price_less_than(filter_results[:max_price]) if filter_results[:max_price].present?
      @toys = @toys.price_greater_than(filter_results[:min_price]) if filter_results[:min_price].present?
    end

    def filters?
      filter_options.any? { |k,v| k.present? && v.present? }
    end
end
