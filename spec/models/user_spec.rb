require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '入力が正しい時、ユーザー登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空の時、ユーザー登録ができない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の時、ユーザー登録ができない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性でない時、ユーザー登録ができない' do
        user2 = FactoryBot.create(:user)
        @user.email = user2.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@マークが含まれていない時、ユーザー登録ができない' do
        @user.email = @user.email.sub('@', '')
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空の時、ユーザー登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字より少ない場合、ユーザー登録ができない' do
        @user.password = '11aa'
        @user.password_confirmation = '11aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数混合でない時、ユーザー登録ができない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end
      it 'password_confirmationとパスワードが一致しないユーザー登録ができない' do
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空の時、ユーザー登録ができない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角(漢字・ひあらがな・カタカナ)ではない時、ユーザー登録ができない' do
        @user.first_name = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'last_nameが空の時、ユーザー登録ができない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角(漢字・ひあらがな・カタカナ)ではない時、ユーザー登録ができない' do
        @user.last_name = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'kana_fnameが空の時、ユーザー登録ができない' do
        @user.kana_fname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana fname can't be blank")
      end
      it 'kana_fnameが全角(カタカナ)ではない時、ユーザー登録ができない' do
        @user.kana_fname = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana fname 全角カナを入力してください')
      end
      it 'kana_lnameが空の時、ユーザー登録ができない' do
        @user.kana_lname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lname can't be blank")
      end
      it 'kana_lnameが全角(カタカナ)ではない時、ユーザー登録ができない' do
        @user.kana_lname = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lname 全角カナを入力してください')
      end
      it 'birthdayが空があれば、ユーザー登録ができない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
