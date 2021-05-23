# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users table

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| nickname            | string   | null: false |
| email               | string   | null: false |
| encrypted_password  | string   | null: false |
| first_name          | string   | null: false |
| last_name           | string   | null: false |
| first_name_kana     | string   | null: false |
| last_name_kana      | string   | null: false |
| birth_year          | string   | null: false |
| birth_month         | string   | null: false |
| birth_day           | string   | null: false |

### Association
- belongs_to :buyer
- has_many :products



## buyers table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| postal_code         | string     | null: false                    |
| prefecture          | integer    | null: false                    |
| city                | text       | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | text       |                                |
| phone_number        | text       | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association
- has_one :user



## products table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| condition           | string     | null: false                    |
| delivery_cost       | string     | null: false                    |
| product_area        | integer    | null: false                    |
| delivery_day        | string     | null: false                    |
| sale_price          | string     | null: false                    |
| category_id         | references | null: false, foreign_key: true |
| user_id             | references | null: false, foreign_key: true |
| brand_id            | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- has_many :categories
- has_many :brands



## categories table

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| ancestry | string  | null: false |


### Association
belongs_to :product



## brands table

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |


### Association
belongs_to :product