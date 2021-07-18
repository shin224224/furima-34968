require 'rails_helper'

RSpec.describe ItemPurchaseAddress, type: :model do
  describe '購入履歴の保存' do
    before do
       item = FactoryBot.create(:item)
       user = FactoryBot.create(:user)
      @item_purchase_address = FactoryBot.build(:item_purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      # it 'すべての値が正しく入力されていれば保存できること' do
      #   expect(@item_purchase_address).to be_valid
      # end
      it 'building_nameは空でも保存できること' do
        @item_purchase_address.building_name = ''
        expect(@item_purchase_address).to be_valid
      end
    end
  

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @item_purchase_address.postal_code = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_purchase_address.postal_code = '1234567'
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
        it 'prefecture_idを選択していないと保存できないこと' do
          @item_purchase_address.prefecture_id = 1
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できないこと' do
        @item_purchase_address.city = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @item_purchase_address.address = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      
      it 'phone_numberが空だと保存できないこと' do
        @item_purchase_address.phone_number = ''
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10文字以下では登録できない' do
        @item_purchase_address.phone_number = '1111111111'
        
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが紐付いていないと保存できないこと' do
        @item_purchase_address.user_id = nil
        @item_purchase_address.valid?
        expect(@item_purchase_address.errors.full_messages).to include("User can't be blank")
      end

        it 'itemが紐付いていないと保存できないこと' do
          @item_purchase_address.item_id = nil
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'tokenが空だと保存できないこと' do
          @item_purchase_address.token = ''
          @item_purchase_address.valid?
          expect(@item_purchase_address.errors.full_messages).to include("Token can't be blank")
        end

      end
    end
  end
