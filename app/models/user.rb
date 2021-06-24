class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nickname
         validates :birthday
       
          # has_many : items
          # has_many : item_purchases

          validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
         #memo confirmationはdeviseであるため記載の必要なし　 
          
          with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
            #メモのため残します。空を許さない      with_optionsでvarlidationをまとめる , message: '全角文字を使用してください'
            validates :first_name_zenkaku
            validates :last_name_zenkaku

          end
            
          with_options format: { with:  /\A[ァ-ヶー－]+\z/ } do
           
            validates :first_name_kana_zenkaku
          validates :last_name_kana_zenkaku
          end
        end
end
