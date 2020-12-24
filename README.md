# アプリケーション名
オリジナルニュース

# アプリケーション概要
	このアプリケーションでできることを記述しましょう。

# 本番環境

デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。
#テスト用アカウント
	ログイン機能等を実装した場合は、記述しましょう。またBasic認証等を設けている場合は、そのID/Passも記述しましょう。
利用方法	このアプリケーションの利用方法を説明しましょう
# 制作意図

目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。
# DEMO
実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。
実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。

# 実装予定の内容



# DB設計


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
|url             |text       |null: false|
|img             |text       |null: false|
|user           |references | null: false,foreign_key: true|

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
