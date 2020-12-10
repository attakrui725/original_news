
## users
|Column              |Type  |Options    |
|--------------------|------|-----------|
|nickname            |string|null: false|
|email               |string|null: false|
|encrypted_password  |string|null: false|

### Association
- has_many :articles
- has_many :comment
- has_many :output


## articles
|Column          |Type       |Options    |
|----------------|-----------|-----------|
|name            |string     |null: false|
|description     |text       |null: false|
| user           |references | null: false,foreign_key: true|

### Association
- has_many :comments
- belongs_to :user



## comments
|Column          |Type       |Options                       |
|----------------|-----------|------------------------------|
|text            |text       |null: false                   |
| user           |references | null: false,foreign_key: true|
| article        |references | null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article



## outputs
|Column         |Type       |Options                       |
|---------------|-----------|------------------------------|
|text           |text       |null: false                   |
|user           |references | null: false,foreign_key: true|

### Association
- belongs_to :user

