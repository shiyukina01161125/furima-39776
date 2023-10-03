require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  describe '商品購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    end
    sleep 3

    context '商品購入ができるとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
      it '建物名は任意' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号がハイフンなしだと登録できない' do
        @order_form.post_code = '1111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では登録できない' do
        @order_form.delivery_area_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では登録できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order_form.telephone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号にハイフンがあると登録できない' do
        @order_form.telephone_number = '000-0000-000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid.", "Telephone number is too long (maximum is 11 characters)")
      end
      it '電話番号は9桁以下の場合は登録できない' do
        @order_form.telephone_number = '000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it '電話番号は12桁以上の場合は登録できない' do
        @order_form.telephone_number = '000000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
      it 'クレジットカード情報が空だと登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが空だと登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが空だと登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
