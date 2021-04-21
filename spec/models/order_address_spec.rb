require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    describe '商品購入機能' do
      context '商品購入できるとき' do
        it '必須項目を入力すると購入できること' do
          expect(@order).to be_valid
        end

        it '建物名が空でも購入できること' do
          @order.building_name = ''
          expect(@order).to be_valid
        end
      end

      context '商品購入できないとき' do
        it '郵便番号が空では購入できないこと' do
          @order.postal_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code ハイフンを含めてを入力してください")
        end

        it '都道府県が--では購入できないこと' do
          @order.shipping_area_id = 1
          @order.valid?
          expect(@order.errors.full_messages).to include("Shipping area must be other than 1")
        end

        it '市区町村が空では購入できないこと' do
          @order.municipality = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Municipality can't be blank")
        end

        it '番地が空では購入できないこと' do
          @order.address = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空では購入できないこと' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        it '郵便番号にはハイフンがないと購入できないこと' do
          @order.postal_code = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code ハイフンを含めてを入力してください")
        end

        it '電話番号にハイフンがあると購入できないこと' do
          @order.phone_number = '-'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number 11桁以内の数字を入力してください")
        end

        it '電話番号が11字以上では購入できないこと' do
          @order.phone_number = '090123456789'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number 11桁以内の数字を入力してください")
        end

        it '電話番号が英数字混合だと購入できないこと' do
          @order.phone_number = '090a123b456'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number 11桁以内の数字を入力してください")
        end
      end
    end
  end
end
