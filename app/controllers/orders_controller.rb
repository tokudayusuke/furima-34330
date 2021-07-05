class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :contributor_confirmation, only: :index

  def index
    @order_address = OrderAddress.new
    @product = Product.find(params[:product_id])

  end

  def create
    @order_address = OrderAddress.new(order_params)
    @product = Product.find(params[:product_id])
    if @order_address.valid?
      Payjp.api_key = "sk_test_c5b81a744d9ad53a3abc4359" 
      Payjp::Charge.create(
        amount: @product.sale_price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
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
end
