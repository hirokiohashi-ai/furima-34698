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

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| money        | integer    | null: false       |
| product_name | string     | null: false       |
| description  | text       | null: false       |
| active_hash  | integer    | null: false       |
| user         | references | foreign_key: true |

## items Association
belongs_to:user
has_one:buy

## buy テーブル

| Column       | Type       | Options           |
| ------------ | -----------| ----------------- |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

## buy Association
has_one:items
belongs_to:user
has_one:address

## address テーブル

| Column          | Type       | Options           |
| --------------- | -----------| ----------------- |
| postal_ code    | string     | null: false       |
| prefectures     | string     | null: false       |
| municipality    | string     | null: false       |
| house_number    | string     | null: false       |
| building_name   | string     |                   |
| tel             | string     | null: false       |
| buy             | references | foreign_key: true |

## address Association
has_one:buy