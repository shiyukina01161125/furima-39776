require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '商品購入' do
    before do
      @address = FactoryBot.build(:address)
    end

    context '商品購入ができるとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列のみ' do
        @address.post_code = '111-1111'
        @address.valid?
        expect(@address.errors.full_messages)expect(@item.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では登録できない' do
        @address.delivery_area_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Category can't be blank")
      end

      it '市区町村が空では登録できない' do
        @address.municipality = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では登録できない' do
        @address.street_address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @address.telephone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '電話番号は10桁以上11桁以内の半角数値のみ' do
        @address.telephone_number = '0000000000'
        @address.valid?
        expect(@address.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '建物名は任意' do
        @address.building_name = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Price can't be blank")
      end
      end
    end
  end
end
end
