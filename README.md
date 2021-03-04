# README

# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false ,unique:true|
| encrypted_password   | string | null: false |
| first_name  | string | null: false |
| family_name | string | null: false |
| read_first  | string | null: false |
| read_family | string | null: false |
| birth       | date   | null: false |

### Association

- has_many :items
- has_many :item_purchases


## items テーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| explanation         | text       | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| postage_type_id     | integer    | null: false |
| prefectures_id      | integer    | null: false |
| preparation_days_id | integer    | null: false |
| value               | integar    | null: false |
| user                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :item_purchase
- belongs_to :seller, class_name: "User"


## item_purchases テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item      | references |  foreign_key: true |
| user          | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :subscriber




## subscriber テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures_id  | integer    | null: false |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item_purchase |  references    | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase
