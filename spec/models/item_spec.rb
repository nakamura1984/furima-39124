require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品新規登録できる場合' do
      it 'name、image、detail、category_id、condition_id、shipping_cost_id、area_of_origin_id、estimated_sipping_date_id、selling_priceとが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品新規登録できない場合' do
      it '商品画像を1枚つけることが必須であること。' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が必須であること。' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が必須であること。' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it 'カテゴリーの情報が必須であること。' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリー選択してください")
      end

      it '商品の状態の情報が必須であること。' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態選択してください")
      end

      it '配送料の負担の情報が必須であること。' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担選択してください")
      end

      it '発送元の地域の情報が必須であること。' do
        @item.area_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域選択してください")
      end

      it '発送までの日数の情報が必須であること。' do
        @item.estimated_sipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数選択してください")
      end

      it '価格の情報が必須であること。' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
        @item.selling_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
        @item.selling_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end

      it '価格は半角数値のみ保存可能であること。' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      it 'userが紐づいてなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
