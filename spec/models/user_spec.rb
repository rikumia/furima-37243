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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードが無効です。文字と数字を含めてください。", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードが無効です。文字と数字を含めてください。")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードが無効です。文字と数字を含めてください。")
      end
      it 'passeordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'aaaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'famiry_nameが空では登録出来ない' do
        @user.famiry_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字は全角文字で入力してください。")
      end
      it 'first_nameが空では登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は全角文字で入力してください。")
      end
      it 'famiry_name_kanaが空では登録出来ない' do
        @user.famiry_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください", "名字カナは全角カナで入力してください")
      end
      it 'first_name_kanaが空では登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください", "名前カナは全角カナで入力してください")
      end
      it 'birthdayが空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'famiry_nameが全角（漢字・ひらがな・カタカナ）でなければ登録出来ない' do
        @user.famiry_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角文字で入力してください。")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録出来ない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角文字で入力してください。")
      end
      it 'famiry_name_kanaが全角（カタカナ）でなければ登録出来ない' do
        @user.famiry_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角文字で入力してください。")
      end
      it 'first_name_kanaが全角（カタカナ）でなければ登録出来ない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角文字で入力してください。")
      end
      it 'emailに@がない場合は登録できないこと ' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = 'ああああ111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードが無効です。文字と数字を含めてください。")
      end
    end
  end
end
