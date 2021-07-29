class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
  end

  private

  def message_params
    params.require(:item).permit(:image. :products, :products_description, :category_id, :status_id, :fee_burden_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

end
