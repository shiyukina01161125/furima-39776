class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show ]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = @items.messages.includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end


  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :item_explanation,
      :price,
      :category_id,
      :item_situation_id,
      :delivery_charge_id,
      :delivery_area_id,
      :delivery_day_id,
      :item_image
    ).merge(user_id: current_user.id)
  end
end
