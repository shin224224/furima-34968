require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
  
    before do
    @user = FactoryBot.build(:user)
  end

  describe '会員情報入力' do
    context '新規登録できる時' do
     it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
     expect(@user).to be_valid
     end
  
     it 'passwordとpassword_confirmationが6文字以上半角英数字混合であれば登録できる' do
       @user.password = 'aaa111'
       @user.password_confirmation ='aaa111'
       expect(@user).to be_valid
     end
  end
 end

  context '新規登録できないとき' do
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
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
     
    
    it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは数値のみでは登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end




    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaa11'
      @user.password_confirmation = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    

      it "名字が空だと登録できない" do
        @user.last_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku can't be blank")
        end
        it "名前が空だと登録できない" do
        @user.first_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku can't be blank")
        end
        it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name_zenkaku = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku is invalid")
        end
        it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name_zenkaku = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku is invalid")
        end
        it "フリガナ（名字）が空だと登録できない" do
        @user.last_name_kana_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana zenkaku can't be blank")
        end
        it "フリガナ（名前）が空だと登録できない" do
        @user.first_name_kana_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana zenkaku can't be blank")
        end
        it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana_zenkaku = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana zenkaku is invalid")
        end
        it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana_zenkaku = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana zenkaku is invalid")
        end
        it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
  end
  end
end

