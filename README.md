# テーブル設計
## users テーブル

| column                  | Type   | Options    |
| ----------------------- | ------ | ---------- |
| nickname                | string | null:false |
| email                   | string | null:false |
| encrypted_password      | string | null:false |
| password_confirmation   | string | null:false |
| first_name_zenkaku      | string | null:false |
| last_name_zenkaku       | string | null:false |
| first_name_kana_zenkaku | string | null:false |
| last_name_kana_zenkaku  | string | null:false |
| birthday                | date   | null:false |






##  addressテーブル
| column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_cord   | string  | null:false                     |
| prefectures   | integer | null:false , foreign_key: true |
| city          | string  | null:false                     |
| address       | string  | null:false                     |
| building_name | string  |                                |
| phone_number  | string  | null:false                     |


## Items テーブル

| column          | Type    | Options    |
| --------------- | ------- | ---------- |
| name            | string  | null:false |
| category        | string  | null:false |
| explanation     | text    | null:false |
| status          | string  | null:false |
| delivery_charge | string  | null:false |
| area            | string  | null:false |
| scheduled_days  | string  | null:false |
| price           | integer | null:false |

