require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、double_byte_first_nameとdouble_byte_last_name、
          double_byte_first_name_kanaとdouble_byte_last_name_kana、date_of_birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'n2345'
        @user.password_confirmation = 'n2345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'nnnnnn'
        @user.password_confirmation = 'nnnnnn'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'passwordが全角では登録できない' do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'お名前(全角)は、名字の入力が必須であること' do
        @user.double_byte_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角文字を使用してください")
      end

      it 'お名前(全角)は、名前の入力が必須であること' do
        @user.double_byte_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角文字を使用してください")
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.double_byte_last_name = 'nn'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角文字を使用してください")
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.double_byte_first_name = 'nn'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角文字を使用してください")
      end

      it 'お名前(カナ)は、名字が必須であること' do
        @user.double_byte_last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角カナを使用してください")
      end

      it 'お名前(カナ)は、名前が必須であること' do
        @user.double_byte_first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角カナを使用してください")
      end

      it 'お名前(カナ)は、名字が必須であること' do
        @user.double_byte_last_name_kana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角カナを使用してください")
      end

      it 'お名前(カナ)は、名前が必須であること' do
        @user.double_byte_first_name_kana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前全角カナを使用してください")
      end

      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it '生年月日の年が空では登録できない' do
        @user.date_of_birth = '-1-1'
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it '生年月日の月が空では登録できない' do
        @user.date_of_birth = '1980--1'
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it '生年月日の日が空では登録できない' do
        @user.date_of_birth = '1980-1-'
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
