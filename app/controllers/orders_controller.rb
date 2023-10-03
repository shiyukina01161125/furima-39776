class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create ]
  before_action :order_form, only: :index

  def index
    @orderform = OrderForm.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save(params,current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_code, :delivery_area_id, :municipality, :street_address, :telephone_number ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def order_form
    return unless current_user == @item.user || @item.order.present?
    redirect_to root_path
  end
  
  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_c4e1fea1846addbad524bae0"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end