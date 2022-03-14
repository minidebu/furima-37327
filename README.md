## Users　table

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| kana_fname  | string  | null: false |
| kana_lname  | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association
- has_many :items
- has_many :buy_records

## Items table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| name       | string     | null: false                    |
| text       | string     | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| price      | string     | null: false                    |
| postage_by | string     | null: false                    |
| place      | string     | null: false                    |
| days       | string     | null: false                    |
| user_id    | references | null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buy_record
- belongs_to :buy_info

## Buyers_info table
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone        | integer    | null: false                    |
| item_id      | references | null: false ,foreign_key: true |

### Association
- belongs_to :item

## Buy_records table
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false ,foreign_key: true |
| item_id | references | null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
