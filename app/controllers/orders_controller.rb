class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create ]
  before_action :order_form, only: :index

  def index
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      @orderform.save(params,current_user.id)
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :delivery_area_id, :municipality, :street_address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def order_form
    return unless current_user != @item.user
    redirect_to root_path
  end
  
  def find_item
    @item = Item.find(params[:item_id])
  end
end