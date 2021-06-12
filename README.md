# テーブル設計
## users テーブル
| culumn                 | Type   | Options    |     |     |     |     |     |     |     |     |     |     |     |     |     |
| ---------------------- | ------ | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| nickname               | string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |     |
| email                  | string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |     |
| encrypted_password     | string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |     |
| password_confirmation  | string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |     |
| first_name_zenkaku     | string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |     |
| last_name_zenkaku      | string | null:false    
| first_name_kana_zenkaku| string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |
| last_name_kana_zenkaku | string | null:false |     |     |     |     |     |     |     |     |     |     |     |     |     |
| birthday               |        |            |     |     |     |     |     |     |     |     |     |     |     |     |     |


## Cards テーブル
| culumn                   | Type   | Options    |
| ------------------------ | ------ | ---------- |
| id                       | string | null:false |
| card_number              | string | null:false |
| expiration date          | string | null:false |
| credit_card_approvalcode | string | null:false |
| postal_cord              | string | null:false |
| state                    | string | null:false |
| city                     | string | null:false |
| adress                   | string | null:false |
| buildingname             | string |            |
| phone_number             | string | null:false |
|                          |        |            |

## Itemss テーブル

| culumn          | Type   | Options    |
| --------------- | ------ | ---------- |
| id              | string | null:false |
| image_url       | string | null:false |
| name            | string | null:false |
| category        | string | null:false |
| explain         | string | null:false |
| status          | string | null:false |
| delivery_charge | string | null:false |
| area            | string | null:false |
| days            | string | null:false |
| price           | string | null:false |
|                 |        |            |

## Brand_items テーブル

| culumn   | Type   | Options    |
| -------- | ------ | ---------- |
| brand_id | string | null:false |
| item_id  | string | null:false |
|          |        |            |

## Brands テーブル

| culumn          | Type   | Options    |
| --------------- | ------ | ---------- |
| id              | string | null:false |