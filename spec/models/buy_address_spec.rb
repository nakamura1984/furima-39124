require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
  end

  describe '商品新規購入登録' do
    context '商品新規購入登録できる場合' do
      it 'address、municipality、post_code、telephone_number、area_of_origin_id、building_name、tokenとが存在すれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'address、municipality、post_code、telephone_number、area_of_origin_id、tokenとが存在し、building_nameがなくても保存できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
      
    end
    context '商品新規登録できない場合' do
      it '郵便番号が必須であること。' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号にハイフンの記述が必須であること。' do
        @buy_address.post_code = 1_111_111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号無効です")
      end

      it '電話番号が必須であること。' do
        @buy_address.telephone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号には9桁以上が必須であること。' do
        @buy_address.telephone_number = 111_111_111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号無効です ")
      end

      it '電話番号には12桁以内が必須であること。' do
        @buy_address.telephone_number = 111_111_111_111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号無効です ")
      end

      it '電話番号には半角入力が必須であること。' do
        @buy_address.telephone_number = '１１１１１１１１１１１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号無効です ")
      end

      it '市区町村が必須であること。' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it '住所の情報が必須であること。' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("番地を入力してください")
      end

      it '都道府県の情報が必須であること。' do
        @buy_address.area_of_origin_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("都道府県を選択してくだい")
      end
    
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it "user_id（購入者）が空だと購入できない" do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Userを入力してください")
      end

      it "item_id（購入商品）が空だと購入できない" do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
