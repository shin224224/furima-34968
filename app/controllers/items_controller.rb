class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
    # created_at 作成日時  DESC 降順 (新しい順)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path

    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :explanation, :status_id, :delivery_charge_id, :prefecture_id,
                                 :scheduled_day_id, :price, :user).merge(user_id: current_user.id)
  end
end
