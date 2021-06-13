# テーブル設計
## users テーブル

| column                  | Type   | Options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null:false |
| email                   | string | null:false |
| encrypted_password      | string | null:false ||
| first_name_zenkaku      | string | null:false |
| last_name_zenkaku       | string | null:false |
| first_name_kana_zenkaku | string | null:false |
| last_name_kana_zenkaku  | string | null:false |
| birthday                | date   | null:false |

- has_many : address
- has_many : Items
- has_many : Item_purchases



##  addressテーブル
| column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_cord   | string     | null:false                     |
| prefectures   | integer    | null:false , foreign_key: true |
| city          | string     | null:false                     |
| address       | string     | null:false                     |
| building_name | string     |                                |
| phone_number  | string     | null:false                     |
| user          | references | null:false                     |
| item          | references | null:false                     |

- has_one : Item
- has_one : item_purchase
- belongs_to : user


## Items テーブル

| column             | Type    | Options    |
| ------------------ | ------- | ---------- |
| name               | string  | null:false |
| category_id        | integer | null:false |
| explanation        | text    | null:false |
| status_id          | integer | null:false |
| delivery_charge_id | integer | null:false |
| prefecture_id      | integer | null:false |
| scheduled_day_id   | integer | null:false |
| price              | integer | null:false |

- has_one : address
- has_one : item_purchase
- belongs_to : user


## Item_purchases テーブル

| column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user    | integer | null:false , foreign_key: true |
| item    | integer | null:false , foreign_key: true |
| address | integer | null:false , foreign_key: true |

- has_one : address
- has_one : item
- belongs_to : user
