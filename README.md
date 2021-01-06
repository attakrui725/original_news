# アプリケーション名
オリジナルニュース

# アプリケーション概要
毎日をオトクにできるニュースアプリケーション
通信、光熱費、金融、税金など、見直ししたらオトクできるにポイントはたくさんあります。オトクになるような情報を共有し様々な人の考えを知ることで、生活のクオリティを向上させることができるwebアプリケーションです


# 制作意図

## 課題　
自分たちの毎日をオトクにできるニュースサイト
毎月の固定費の支払いや、資金の運用において、もったいない状況で、そのままにしてしまっている人が多い。例、通信費、水道光熱費、資産運用、税金対策など。
ただ、これらに取り掛かるとしても、いきなり勉強を始めるのはなかなかハードルが高く、何から、勉強を始めるべきか迷ってしまうところがある。

## 対策

いきなり、これらに関して勉強するのではなく、毎日これらの情報に対して少しでも触れていくことで、徐々に理解をしていくことができる。ただ、幅広いジャンルのサイトの記事を毎日閲覧したり、本を読むのは負担がかかる。
なので、一つのアプリケーションでそれらの情報に毎日触れる機会をもつことで、情報リテラシーを向上させることができると考える。
# 本番環境
https://original-news-0725.herokuapp.com/

- メールアドレス a@gmail.com

- password 111aaa

# DEMO
記事投稿機能
ウェブページのurlを投稿することで、簡単にオトクなニュースを共有できます。
https://gyazo.com/a4d86c049d773147c120394e0f4e5cdc

# 実装予定の内容
・記事ジャンル別ページ切り替え機能
・動画の提案機能
・SNS認証機能



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
|genre_id        |integer    |null: false|
|user            |references |null: false,foreign_key: true|

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
