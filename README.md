## users

| Column             | Type   | Options                  |
| -----------------  | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_year         | date   | null: false              |
| birth_month        | date   | null: false              |
| birth_date         | date   | null: false              |

### Association
has_many :items
has_many :buys


## items

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| products             | string     | null: false                    |
| products_description | text       | null: false                    |
| category             | integer    | null: false                    |
| status               | integer    | null: false                    |
| fee_burden           | integer    | null: false                    |
| delivery_address     | integer    | null: false                    |
| delivery_time        | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :buy


## buys

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_many :item
has_one :address


## addresses

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| buy          | references | null: false, foreign_key: true |

### Association
belongs_to :buy