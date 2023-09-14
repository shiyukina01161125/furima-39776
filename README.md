# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| password_check | string | null: false |
| name           | string | null: false |
| name_kana      | string | null: false |
| birth_day_yy   | string | null: false |
| birth_day_mm   | string | null: false |
| birth_day_dd   | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :favorites
- belongs_to :address
- belongs_to :credit

## items テーブル

#　画像は【Active Storage】？

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_image       | string     | null: false                    |
| item_name        | string     | null: false                    |
| item_explanation | text       | null: false                    |
| category         | string     | null: false                    |
| item_situation   | string     | null: false                    |
| delivery_charge  | string     | null: false                    |
| delivery_area    | string     | null: false                    |
| delivery_day     | string     | null: false                    |
| price            | string     | null: false                    |
| commission       | string     | null: false                    |
| profit           | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :favorites

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| comment | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item

## favorites テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| comment | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item

## comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipality     | text       | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## credit テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| credit_card    | references | null: false, foreign_key: true |
| date_of_expiry | references | null: false, foreign_key: true |
| security_code  | references | null: false, foreign_key: true |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
