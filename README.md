# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| frist_name         | string | null: false               |
| famiry_nameカナ     | string | null: false               |
| frist_nameカナ      | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many  :items
- has_many  :orders

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_name          | string     | null: false　　　　　　　　　　　  |
| item_explanation   | text       | null: false                    |
| category           | string　   | null: false                     |
| product_condition  | string     | null: false                     |
| shipping_area      | string     | null: false                     |
| days_to_ship       | string     | null: false                     |
| price              | integer    | null: false                     |

### Association

- has_one  :orsers
- belongs_to  :users

## orderテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- has_one  :addresses
- belongs_to  :users
- belongs_to  :items

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| oder_id            | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| address_line1      | string     | null: false                    |
| tell               | string     | null: false                    |

### Association

- belongs_to  :orders
