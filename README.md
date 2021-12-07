# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| frist_name         | string | null: false               |
| famiry_name_kana   | string | null: false               |
| frist_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many  :items
- has_many  :orders

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item_name            | string     | null: false　　　　　　　　　　　  |
| item_explanation     | text       | null: false                    |
| category_id          | integer    | null: false                     |
| product_condition_id | integer    | null: false                     |
| pay_for_shipping_id  | integer    | null: false                     |
| shipping_area_id     | integer    | null: false                     |
| days_to_ship_id      | integer    | null: false                     |
| price                | integer    | null: false                     |

### Association

- has_one  :order
- belongs_to  :user

## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_one  :address
- belongs_to  :user
- belongs_to  :item

## addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order              | references | null: false, foreign_key: true |
| postal_code        | string     | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| address_line1      | string     | optional: true                 |
| tell               | string     | null: false                    |

### Association

- belongs_to  :order
