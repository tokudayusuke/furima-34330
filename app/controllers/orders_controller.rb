class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :contributor_confirmation, only: :index
  before_action :set_order, only: [:index, :create]

  def index
    @order_address = OrderAddress.new

  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_product
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number ).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def contributor_confirmation
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user == @product.user || @product.order.present?
  end

  def set_order
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.sale_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
