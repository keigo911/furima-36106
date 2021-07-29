class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :products
    validates :products_description
    validates :category_id
    validates :status_id
    validates :fee_burden_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :price
  end



end
