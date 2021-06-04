# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| kana       | string | null: false |
| birthday   | string | null: false |

## users アソシエーション
has_many:items
has_many:buy
has_one:addres

## items テーブル

| Column       | Type          | Options     |
| ------------ | ------------- | ----------- |
| image        | ActiveStorage | null: false |
| product_name | string        | null: false |
| description  | text          | null: false |
| user_id      | references    |             |

## items アソシエーション
belongs_to:user
has_many:buy

## buy テーブル

| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| product_name    | string     | null: false |
| card_pass       | string     | null: false |
| expiration_date | string     | null: false |
| security_code   | string     | null: false |
| user_id         | references |             |
| items_id        | references |             |

## buy アソシエーション
has_many:items
belongs_to:users
has_one:address

## address テーブル

| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| postal_ code    | string     | null: false |
| prefectures     | string     | null: false |
| municipality    | string     | null: false |
| house_number    | string     | null: false |
| building_name   | text       |             |
| tel             | string     |             |

## address アソシエーション
has_one:buy
has_one:users
