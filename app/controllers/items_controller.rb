class ItemsController < ApplicationController
  def index
  end

  private

  def message_params
    params.require(:item).permit(:image. :products, :products_description, :category_id, :status_id, :fee_burden_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

end
