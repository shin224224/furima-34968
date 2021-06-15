# テーブル設計
## users テーブル

| column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ | 
| nickname                | string | null:false               | 
| email                   | string | null:false ,unique: true | 
| encrypted_password      | string | null:false               |     
| first_name_zenkaku      | string | null:false               |     
| last_name_zenkaku       | string | null:false               |     
| first_name_kana_zenkaku | string | null:false               |     
| last_name_kana_zenkaku  | string | null:false               |     
| birthday                | date   | null:false               | 


- has_many : items
- has_many : item_purchases



##  addressesテーブル
| column         | Type       | Options                       |     
| -------------- | ---------- | ----------------------------- | 
| postal_cord    | string     | null:false                    |  
| prefectures_id | integer    | null:false                    |     
| city           | string     | null:false                    |     
| address        | string     | null:false                    |    
| building_name  | string     |                               |     
| phone_number   | string     | null:false                    |    
| item_purchase  | references | null:false, foreign_key: true |     

- belongs_to : item_purchase


## items テーブル

| column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null:false                    |
| category_id        | integer    | null:false                    |
| explanation        | text       | null:false                    |
| status_id          | integer    | null:false                    |
| delivery_charge_id | integer    | null:false                    |
| prefecture_id      | integer    | null:false                    |
| scheduled_day_id   | integer    | null:false                    |
| price              | integer    | null:false                    |
| user               | references | null:false, foreign_key: true |

- has_one : item_purchase
- belongs_to : user


## item_purchases テーブル

| column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |


- has_one : address
- belongs_to : item
- belongs_to : user
<!-- 親から子はhas_one -->