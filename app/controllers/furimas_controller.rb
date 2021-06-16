class FurimasController < ApplicationController


  before_action :authenticate_user!, except: [:index]

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @prodt.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def product_params
    params.require(:product).permit(:category_id, :condition_id, :delivery_cost_id, :delivery_day_id, :product_area_id, :image).merge(user_id: current_user.id)
  end
end

