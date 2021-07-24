class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :new, :create]

  # usercontroller はユーザの詳細ページがいる場合は作成する必要がある。

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
      #  memo 処理が完了した後に行うパスはroot_path（TOPに戻る場合）  items_pathは同じアクションだがURI Patternがちがう　
      #  memo render:indexは使用しない遷移するときはちがう。

    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :explanation, :status_id, :delivery_charge_id, :prefecture_id,
                                 :scheduled_day_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if @item.user != current_user || @item.item_purchase.present?
      redirect_to action: :index
      # @item = Item.find(params[:id])はsetitemで定義しているので、@itemを定義していない。
      # || = A or B
    end
  end
end
