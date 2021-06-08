require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが5文字以下では登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英字だけでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、数字だけでは登録できないこと' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは全角英字だけでは登録できないこと' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは全角数字だけでは登録できないこと' do
      @user.password = '２２２２２２'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードと確認用パスワードが一致していなければ登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '確認用パスワードの入力が必須であること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は名字が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名は名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end 

     it 'ユーザー本名の名字は全角での入力が必須であること' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors[:last_name]).to include
     end

     it 'ユーザー本名の名前は全角での入力が必須であること' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors[:first_name]).to include
     end

     it 'ユーザー本名の名字は、フリガナが必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
  
     it 'ユーザー本名の名前は、フリガナが必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it 'ユーザー本名の名字のフリガナは全角での入力が必須であること' do
      @user.last_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include
     end

     it 'ユーザー本名の名前のフリガナは半角では登録できないこと' do
      @user.first_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include
     end

     it '生年月日の入力が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
  end
end





