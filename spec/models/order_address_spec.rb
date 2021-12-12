require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it 'postal_code,shipping_area_id,city,address,tell,tokenが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'postal_codeが3桁＋ハイフン＋4桁の組み合わせであれば購入できる' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'shipping_area_idがあれば購入できる' do
        @order_address.shipping_area_id = '2'
        expect(@order_address).to be_valid
      end
      it 'cityがあれば購入できる' do
        @order_address.city = '名古屋市'
        expect(@order_address).to be_valid
      end
      it 'addressがあれば購入できる' do
        @order_address.address = '1-1'
        expect(@order_address).to be_valid
      end
      it 'tellが11桁であれば購入できる' do
        @order_address.tell = '09011112222'
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば購入できる' do
        @order_address.token = '"tok_abcdefghijk00000000000000000"'
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank",
                                                               'Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'shipping_area_idが空では購入できない' do
        @order_address.shipping_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tellが空では購入出来ない' do
        @order_address.tell = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell can't be blank", 'Tell is invalid. Input only number')
      end
      it 'tellが10,11桁以外では購入できない' do
        @order_address.tell = '090111122'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell is invalid. Input only number')
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
