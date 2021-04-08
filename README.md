# テーブル設計

## users テーブル

|Column         |Type   |Options    |
|-------------- |-------|---------- |
|name           |string |null: false|
|email          |string |null: false|
|password       |string |null: false|
|first name     |string |null: false|
|last name      |string |null: false|
|first name_kana|string |null: false|
|last name_kana |string |null: false|
|birthday       |integer|null: false|


### Association

- has_many :items
- has_many :orders

## items テーブル

|Column             |Type      |Options          |
|---------------    |-------   |---------------- |
|image              |string    |null: false      |
|product name       |string    |null: false      |
|product description|text      |null: false      |
|category           |integer   |null: false      |
|product condition  |integer   |null: false      |
|shipping charges   |integer   |null: false      |
|shipping area      |integer   |null: false      |
|days to ship       |integer   |null: false      |
|price              |integer   |null: false      |
|user               |references|foreign_key: true|

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

|Column  |Type      |Options    |
|------  |----------|---------- |
|user    |references|foreign_key: true|
|item    |references|foreign_key: true|

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

|Column          |Type      |Options          |
|--------------- |------    |--------------   |
|card information|integer   |null: false      |
|expiration date |date      |null: false      |
|security code   |integer   |null: false      |
|postal code     |integer   |null: false      |
|Prefectures     |string    |null: false      |
|municipality    |string    |null: false      |
|address         |string    |null: false      |
|Building name   |string    |null: false      |
|phone number    |integer   |null: false      |
|order           |references|foreign_key: true|

### Association

- belongs_to :orders