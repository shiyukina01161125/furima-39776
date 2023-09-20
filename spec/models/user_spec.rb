require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context '新規登録できるとき' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = existing_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスは@を含む必要がある' do
        @user.email = 'invalidemail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが半角英数字混合でないと登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字６文字以上で入力してください")
      end

      it 'パスワードが数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字６文字以上で入力してください')
      end
      
      it 'パスワードが全角文字を含む場合は登録できない' do
        @user.password = 'パスワード１'
        @user.password_confirmation = 'パスワード１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字６文字以上で入力してください')
      end

      it 'パスワードとパスワード（確認）が一致しないと登録できない' do
        @user.password_confirmation = 'mismatchedpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '姓（全角）は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角漢字・ひらがな・カタカナを使用してください")
      end
      
      it '名（全角）は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角漢字・ひらがな・カタカナを使用してください")
      end

      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
      end

      it 'お名前カナ(全角)は、名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end

      it '姓カナ（全角）は全角カタカナでの入力が必須であること' do
        @user.family_name_kana = 'すみす'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
      end
      
      it '名カナ（全角）は全角カタカナでの入力が必須であること' do
        @user.first_name_kana = 'じょん'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end