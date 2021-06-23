class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :first_name_zenkaku, presence: true
         validates :last_name_zenkaku, presence: true
         validates :first_name_kana_zenkaku, presence: true
         validates :last_name_kana_zenkaku, presence: true
         validates :birthday, presence: true
         
          # has_many : items
          # has_many : item_purchases

          with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
            #空を許さない      with_optionsでvarlidationをまとめる , message: '全角文字を使用してください'
            validates :first_name_zenkaku
            validates :last_name_zenkaku

          end
            
          with_options presence: true, format: { with:  /\A[ァ-ヶー－]+\z/ } do
           
            validates :first_name_kana_zenkaku
          validates :last_name_kana_zenkaku
          end

end