## users　table

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false ,unique: true |
| encrypted_password    | string  | null: false               |
| first_name            | string  | null: false               |
| last_name             | string  | null: false               |
| kana_fname            | string  | null: false               |
| kana_lname            | string  | null: false               |
| birthday              | date    | null: false               |


### Association
- has_many :items
- has_many :buy_records

## items table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| info             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| postage_by_id    | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false ,foreign_key: true |

### Association
- belongs_to :user
- has_one :buy_record


## buyers table
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| buy_record    | references | null: false ,foreign_key: true |


### Association
- belongs_to :buy_record


## buy_records table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false ,foreign_key: true |
| item   | references | null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer
