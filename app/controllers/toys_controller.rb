class ToysController < ApplicationController
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  #TODO: seller can access index, show, new, create, edit update, destroy
  # user can access show
  #TODO: items for sale
  def index
    @toys = Toy.all
  end

  def show
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
        format.html { redirect_to @toy, notice: 'Toy was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @toy.destroy
    respond_to do |format|
      format.html { redirect_to toys_url, notice: 'Toy was successfully destroyed.' }
    end
  end

  private
    def set_toy
      @toy = Toy.find(params[:id])
    end

    def toy_params
      params.require(:toy).permit(:name, :price, :description, :image)
    end
end
