# README


## users テーブル

| Column                           | Type   | Options                   |
| -------------------------------- | ------ | ------------------------- |
| nickname                         | string | null: false, unique: true |
| password                         | string | null: false               |
| confirm_password                 | string | null: false               |
| boudle_byte_name                 | string | null: false               |
| double_byte_name_kana            | string | null: false               |
| date_of_birth                    | string | null: false               |
| email                            | string | null: false               |

### Association
- has_many :items
- has_many :buys


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| category               | string     | null: false                    |
| item_condition         | string     | null: false                    |
| shipping_charge        | string     | null: false                    |
| area_of_origin         | string     | null: false                    |
| estimated_sipping_date | string     | null: false                    |

### Association
- belongs_to :user
- has_many :buys

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items
- has_one :addresses

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false, foreign_key: true |
| address          | string     | null: false, foreign_key: true |
| post_code        | string     | null: false                    |
| telephone_number | string     | null: false                    |
| buliding_name    | string     | null: false, foreign_key: true |

- has_many :buys