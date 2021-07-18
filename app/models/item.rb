class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :image
    validates :category_id
    validates :explanation
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :scheduled_day_id
    validates :price
    validates :user
  end
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image
  has_one :item_purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :scheduled_day
  belongs_to :status
  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :scheduled_day_id
    validates :status_id
  end
end
