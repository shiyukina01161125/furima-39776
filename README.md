# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :favorites
- belongs_to :address
- belongs_to :credit

## Items テーブル

#　画像は【Active Storage】？

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category           | string     | null: false                    |
| item_situation_id  | string     | null: false                    |
| delivery_charge_id | string     | null: false                    |
| delivery_area_id   | string     | null: false                    |
| delivery_day_id    | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :favorites

## Addresses テーブル

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

## Orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| credit_card    | references | null: false, foreign_key: true |
| date_of_expiry | references | null: false, foreign_key: true |
| security_code  | references | null: false, foreign_key: true |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
