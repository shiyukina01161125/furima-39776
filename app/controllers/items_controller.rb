class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    @item.item_image.attach(params[:item][:item_image]) if params[:item][:item_image]
  
    if @item.save
      redirect_to @item, notice: 'アイテムが正常に保存されました。'
    else
      flash.now[:alert] = 'アイテムの保存に失敗しました。'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :category_id, :item_situation_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :item_image)
  end
end





