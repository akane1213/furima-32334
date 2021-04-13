require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品できるとき' do
        it '必須項目を入力すると出品できること' do
          expect(@item).to be_valid
        end
      end


      context '商品出品できないとき' do
        it '商品画像が空では出品できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空白では出品できないこと' do
          @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end

        it '商品の説明が空白では出品できないこと' do
          @item.product_description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end

        it 'カテゴリーの情報が--では出品できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it '商品の状態の情報が--では出品できないこと' do
          @item.product_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition must be other than 1")
        end

        it '配送料の負担の情報が--では出品できないこと' do
          @item.shipping_charges_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
        end

        it '発送元の地域の情報が--では出品できないこと' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
        end

        it '発送までの日数の情報が--では出品できないこと' do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
        end

        it '価格についての情報が空では出品できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '販売価格は半角数字のみでなければ保存できないこと' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it '価格が299以下だと出品できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it '価格が10000000だと出品できないこと' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end
      end
    end
  end
end
