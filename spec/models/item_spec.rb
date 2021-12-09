require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'item_name,item_explanation,category_id,product_condition_id,pay_for_shipping_id,shipping_area_id,days_to_ship_id,price,imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'item_nameがあれば出品できる' do
        @item.item_name = "aaa"
        expect(@item).to be_valid
      end
      it 'item_explanationがあれば出品できる' do
        @item.item_explanation = "aaa"
        expect(@item).to be_valid
      end
      it 'category_idがあれば出品できる' do
        @item.category_id = "2"
        expect(@item).to be_valid
      end
      it 'product_condition_idがあれば出品できる' do
        @item.product_condition_id = "2"
        expect(@item).to be_valid
      end
      it "pay_for_shipping_idがあれば出品できる" do
        @item.pay_for_shipping_id = "2"
        expect(@item).to be_valid
      end
      it 'shipping_area_idがあれば出品できる' do
        @item.shipping_area_id = "2"
        expect(@item).to be_valid
      end
      it 'days_to_ship_idがあれば出品できる' do
        @item.days_to_ship_id = "2"
        expect(@item).to be_valid
      end
      it 'priceがあれば出品できる' do
        @item.price = "3000"
        expect(@item).to be_valid
      end
      it 'imageがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_explanationが空では出品できない ' do
        @item.item_explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_condition_idが空では出品できない' do
        @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'pay_for_shipping_idが空では出品できない' do
        @item.pay_for_shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Pay for shipping can't be blank")
      end
      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid. Input half-width characters", "Price is out of setting range")
      end
      it 'priceは300~9,999,999の間のみでなければ出品できない' do
        @item.price = "10"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceは半角数字のみでなければ出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
