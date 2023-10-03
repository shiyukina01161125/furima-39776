class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy ]
  before_action :find_item, only: [:show, :edit, :update, :destroy ]

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
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    return unless current_user != @item.user || @item.order.present?
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    end
    redirect_to root_path
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

  def find_item
    @item = Item.find(params[:id])
  end
end
