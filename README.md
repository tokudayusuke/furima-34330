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

| Column              | Type     | Options                   |
| ------------------- | -------- | ------------------------- |
| nickname            | string   | null: false               |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| first_name          | string   | null: false               |
| last_name           | string   | null: false               |
| first_name_kana     | string   | null: false               |
| last_name_kana      | string   | null: false               |
| birthday            | date     | null: false               |


### Association
- has_many :products
- has_many :records



## shipping_addresses table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| record              | references | null: false, foreign_key: true |

### Association
- belongs_to :record



## products table

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| condition_id           | integer    | null: false                    |
| delivery_cost_id       | integer    | null: false                    |
| product_area_id        | integer    | null: false                    |
| delivery_day_id        | integer    | null: false                    |
| sale_price             | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| category_id            | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :record



## records table

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |


### Association
- has_one :shipping_address
- belongs_to :product
- belongs_to :user