class Item < ApplicationRecord

  validates :name, presence:true
  validates :image, presence:true
  validates :category_id, presence:true
  validates :explanation, presence:true
  validates :status_id, presence:true
  validates :delivery_charge_id, presence:true
  validates :prefecture_id, presence:true
  validates :scheduled_day_id, presence:true
  validates :price, presence:true
  validates :price, format: {with: /\A[0-9]+\z/ }
  validates :price, numericality: { in: 300..9999999 }
  validates :user, presence:true


  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :scheduled_day
  belongs_to :status
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_day_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }

end



