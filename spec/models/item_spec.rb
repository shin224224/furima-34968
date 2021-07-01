require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
  
    before do
    @item = FactoryBot.build(:item)
  end




#画像が空では登録できない
context '出品登録できないとき' do
  it '画像が空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

#商品名が空では登録できない
it '商品名が空では登録できない' do
  @item.name = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Name can't be blank")
end

#カテゴリーが空では登録できない
it 'カテゴリーが空では登録できない' do
  @item.category_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Category can't be blank")
end
#商品の説明が空では登録できない
it '商品の説明が空では登録できない' do
  @item.explanation = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Explanation can't be blank")
end
#商品情報が空では登録できない
it '商品情報が空では登録できない' do
  @item.status_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Status can't be blank")
end
#発想量が空では登録できない
it '発想量が空では登録できない' do
  @item.delivery_charge_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
end
#地域が空では登録できない
it '地域が空では登録できない' do
  @item.prefecture_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Prefecture can't be blank")
end
#日数が空では登録できない。
it '日数が空では登録できない' do
  @item.scheduled_day_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
end
#販売価格が空では登録できない
it '販売価格が空では登録できない' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
end
#memo バリデーションがうまくかかっているか確認をする
it "価格は半角でないと登録できない" do
  @item.price = "１２３４５６"
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
  end

end
end

end