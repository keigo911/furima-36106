require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameがない場合は登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationがない場合は登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameがない場合は登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end

    it 'last_name_kanaがない場合は登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
    end

    it 'first_nameがない場合は登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'first_name_kanaがない場合は登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
    end

    it 'birthdayがない場合は登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが全角入力でなければ登録できないこと' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'passwordが英語のみであれば登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが数字のみであれば登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角であれば登録できないこと' do
      @user.password = 'ａｂｃ１２３'
      @user.password_confirmation = 'ａｂｃ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'emailに@が含まれていない場合は登録できないこと' do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'last_nameが英語では登録できないこと' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが英語では登録できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_kanaが英語では登録できないこと' do
      @user.last_name_kana = 'yamda'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが英語では登録できないこと' do
      @user.first_name_kana = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'last_name_kanaが漢字では登録できないこと' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが漢字では登録できないこと' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
  end
end
