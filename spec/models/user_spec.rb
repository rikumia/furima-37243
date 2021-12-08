require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'nickname,email,password,password_confirmation,family_name.first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字であれば登録できる' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'aaaaa1'
        expect(@user).to be_valid
      end
      it 'famiry_nameが全角文字であれば登録できる' do
        @user.famiry_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字であれば登録できる' do
        @user.first_name = '一郎'
        expect(@user).to be_valid
      end
      it 'famiry_name_kanaが全角かなであれば登録できる' do
        @user.famiry_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角かなであれば登録できる' do
        @user.first_name_kana = 'イチロウ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角かなであれば登録できる' do
        @user.first_name_kana = 'イチロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字でなければ登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passeordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'aaaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'famiry_nameが空では登録出来ない' do
        @user.famiry_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Famiry name can't be blank")
      end
      it 'first_nameが空では登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'famiry_name_kanaが空では登録出来ない' do
        @user.famiry_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Famiry name kana can't be blank")
      end
      it 'first_name_kanaが空では登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
