class FurimasController < ApplicationController


  before_action :authenticate_user!, only: [:new]

  def index
    @product = Product.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end



  private

  def product_params
    params.require(:product).permit(:nickname, :description, :sale_price, :category_id, :condition_id, :delivery_cost_id, :delivery_day_id, :product_area_id, :image).merge(user_id: current_user.id)
  end
end

