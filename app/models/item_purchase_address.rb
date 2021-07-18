class ItemPurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :phone_number, :item_purchase, :building_name, :user_id, :item_id
#フォームオブジェクトで値を使用するための記述 これがないと値が保存できない
#上で定義したものを下で使える
  with_options presence: true do
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number,format: { with: /\A\d{11}\z/}
     validates :user_id
    validates :item_id
     validates :token 
         # validates :item_purchase saveができて初めて値ができるのでバリデーションはいらない
  end
  #  validates :building_name
#validdateは任意のトロ￥ころでは必要ない。

#     # ここにバリデーションの処理を書く


# has_one :address
# belongs_to :item
# belongs_to :user
#保存するとヴァりデーションのチェックをするファイル＝FORMオブジェクト アソシエーションはかかない

  def save
    # 各テーブルにデータを保存する処理を書く
    #購入情報を保存して変数item_purchaseに代入
    item_purchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    #itemの左側はカラム名 右は届いているデータ
    # createの後に!をつけることで強制的にエラーを出すことができる
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number:phone_number, item_purchase_id: item_purchase.id, building_name: building_name)
  end
end