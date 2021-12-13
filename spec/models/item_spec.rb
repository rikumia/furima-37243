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
        @item.item_name = 'aaa'
        expect(@item).to be_valid
      end
      it 'item_explanationがあれば出品できる' do
        @item.item_explanation = 'aaa'
        expect(@item).to be_valid
      end
      it 'category_idがあれば出品できる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'product_condition_idがあれば出品できる' do
        @item.product_condition_id = '2'
        expect(@item).to be_valid
      end
      it 'pay_for_shipping_idがあれば出品できる' do
        @item.pay_for_shipping_id = '2'
        expect(@item).to be_valid
      end
      it 'shipping_area_idがあれば出品できる' do
        @item.shipping_area_id = '2'
        expect(@item).to be_valid
      end
      it 'days_to_ship_idがあれば出品できる' do
        @item.days_to_ship_id = '2'
        expect(@item).to be_valid
      end
      it 'priceがあれば出品できる' do
        @item.price = '3000'
        expect(@item).to be_valid
      end
      it 'imageがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'item_explanationが空では出品できない ' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'product_condition_idが空では出品できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力してください")
      end
      it 'pay_for_shipping_idが空では出品できない' do
        @item.pay_for_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'days_to_ship_idが空では出品できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'category_id_1では出品できない' do
        @item.category_id = 'id_1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'product_condition_id_1では出品できない' do
        @item.product_condition_id = 'id_1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力してください")
      end
      it 'pay_for_shipping_id_1では出品できない' do
        @item.pay_for_shipping_id = 'id_1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'shipping_area_id_1では出品できない' do
        @item.shipping_area_id = 'id_1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'days_to_ship_id_1空では出品できない' do
        @item.days_to_ship_id = 'id_1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください", "金額は半角数字で入力してください", "金額は300円から10000000円までで入力してください")
      end
      it 'priceは300~9,999,999の間のみでなければ出品できない' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300円から10000000円までで入力してください")
      end
      it 'priceは半角数字のみでなければ出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300円から10000000円までで入力してください")
      end
      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = '111a'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300円から10000000円までで入力してください")
      end
      it 'priceに299以下の値では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300円から10000000円までで入力してください")
      end
      it 'priceに10000000以上の値では出品できない' do
        @item.price = '20000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300円から10000000円までで入力してください")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
