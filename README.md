# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_kana          | string | null: false               |
| last_kana           | string | null: false               |
| birthday            | date   | null: false               |


## users Association
has_many:items
has_many:buy
has_one:addres

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| product_name | string     | null: false       |
| description  | text       | null: false       |
| activehash   | string     | null: false       |
| user         | references | foreign_key: true |

## items Association
belongs_to:user
has_many:buy

## buy テーブル

| Column       | Type       | Options           |
| ------------ | -----------| ----------------- |
| product_name | string     | null: false       |
| user         | references | foreign_key: true |
| items        | references | foreign_key: true |

## buy Association
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
| building_name   | string     |             |
| tel             | string     | null: false |

## address Association
has_one:buy
has_one:users
