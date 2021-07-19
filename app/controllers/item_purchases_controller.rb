class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  # ログインしていない人をログインページに移行させる
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]


  def index
    @item_purchase_address = ItemPurchaseAddress.new
  
  end

  def create
   
    @item_purchase_address = ItemPurchaseAddress.new(item_purchase_params)
    if @item_purchase_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: item_purchase_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )

      @item_purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :item_purchase, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  # def address_params formオブジェクトにより合体したので不要
  #   params.permit(:postal_code, :prefecture_id, :prefecture_id, :city, :address, :phone_number, :item_purchase, :building_name).merge(item_purchase: @item_purchase)
  # end
  def move_to_index
  
    if @item.user == current_user
      #==で〜ならばと比較している =一つの場合、代入になってします。
      redirect_to root_path
    end
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end
