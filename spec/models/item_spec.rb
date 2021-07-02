require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 画像が空では登録できない
    context '出品登録できないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名が空では登録できない
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      # カテゴリーが空では登録できない
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      # 商品の説明が空では登録できない
      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      # 商品情報が空では登録できない
      it '商品情報が空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      # 発想量が空では登録できない
      it '発想量が空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      # 地域が空では登録できない
      it '地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      # 日数が空では登録できない。
      it '日数が空では登録できない' do
        @item.scheduled_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
      end
      # 販売価格が空では登録できない
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      # memo バリデーションがうまくかかっているか確認をする
      it '価格は半角でないと登録できない' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '半角英数混合では登録できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '半角英語のみでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '10,000,000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'userが存在しないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'カテゴリーidが2以上でなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      # 商品情報が空では登録できない
      it '商品情報idが2以上でなければ登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      # 発想量が空では登録できない
      it '発想量idが2以上でなければ登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
      end
      # 地域が空では登録できない
      it '地域idが2以上でなければ登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      # 日数が空では登録できない。
      it '日数idが2以上でなければ登録できない' do
        @item.scheduled_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled day must be other than 1')
      end
    end
  end
end
