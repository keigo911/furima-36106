class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_burden
  belongs_to :prefecture
  belongs_to :delivery_time

  VALID_PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :products
    validates :products_description
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: VALID_PRICE_REGEX }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :fee_burden_id
      validates :prefecture_id
      validates :delivery_time_id
    end
  end
end
