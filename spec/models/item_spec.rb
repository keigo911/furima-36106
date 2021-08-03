require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる場合' do
      it '全ての項目の入力が存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品名がなければ登録できない' do
        @item.products = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Products can't be blank")
      end

      it '商品の説明がなければ登録できない' do
        @item.products_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Products description can't be blank")
      end

      it 'カテゴリーがなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it '商品の状態がなければ登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end

      it '配送料の負担がなければ登録できない' do
        @item.fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee burden can't be blank", 'Fee burden is not a number')
      end

      it '発送元の地域がなければ登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it '発送までの日数がなければ登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank", 'Delivery time is not a number')
      end

      it '価格がなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格は10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格は半角以外では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
