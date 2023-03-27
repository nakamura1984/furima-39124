# README


## users テーブル

| Column                           | Type   | Options                   |
| -------------------------------- | ------ | ------------------------- |
| nickname                         | string | null: false               |
| encrypted_password               | string | null: false               |
| double_byte_first_name           | string | null: false               |
| double_byte_last_name            | string | null: false               |
| double_byte_first_name_kana      | string | null: false               |
| double_byte_last_name_kana       | string | null: false               |
| date_of_birth                    | date   | null: false               |
| email                            | string | null: false, unique: true |

### Association
- has_many :items
- has_many :buys


## items テーブル

| Column                 | Type        | Options                        |
| ---------------------- | ----------- | ------------------------------ |
| user                   | references  | null: false, foreign_key: true |
| category               | integer     | null: false                    |
| condition              | integer     | null: false                    |
| shipping_cost          | integer     | null: false                    |
| area_of_origin         | integer     | null: false                    |
| estimated_sipping_date | integer     | null: false                    |
| selling_price          | integer     | null: false                    |
| name                   | string      | null: false                    |
| detail                 | text        | null: false                    |

### Association
- belongs_to :user
- belongs_to :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| area_of_origin   | integer    | null: false                    |
| post_code        | string     | null: false                    |
| telephone_number | string     | null: false                    |
| building_name    | string     |                                |
| buy              | references | null: false, foreign: true     |

### Association
- has_one :buy