<!-- # README

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

* ... -->

## users table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| last_name          | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name         | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |
### Association
* has_many :items
- has_one :address
<!-- 
emailカラムには、unique: trueを追加しましょう！
deviseを導入すると、デフォルトで設定されていますので、READMEにも反映させておきましょう！
passwordを保存するカラムはencrypted_passwordとしましょう！
deviseを導入すると、デフォルトで設定されていますので、READMEにも反映させておきましょう！
usersテーブルに保存する下記カラムが足りないようです。
見本アプリをご確認いただき、カラム追加をしましょう！
名字（漢字）Last name
名前（漢字）First name
名字（カナ）??
名前（カナ）??
誕生日     BirthDate
| birth_date | string | null: false |
今回の実装では、誕生日カラムは「date型」で設計した方が実装が簡単になると考えます。（date型は年、月、日を1つで指定して取得できるため）
-->


## items table
| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| product                | string     | null: false       |
| product_description    | text       | null: false       |
| category_id            | integer    | null: false       |
| status_id              | integer    | null: false       |
| delivery_fee_id        | integer    | null: false       |
| shipment_street_id     | integer    | null: false       |
| shipment_day_id        | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |
### Association
- has_one :address
<!-- 
| price | string | null: false |
コン学は、数値で登録できるように、データ型を変更しましょう！
itemsテーブルにプルダウンから選択するデータを保存するカラムが足りません。
見本アプリをご確認いただき、カラムを追加しましょう！
has_manyを使用するときは、対象のテーブル名を複数形にしましょう！ 
| image | | null: false |
こちらのカラムですが、今回の実装では商品出品の画像投稿において「active_storage」を使用するため、設計の段階から削除しておきましょう。
（理由はactive_storage導入時に自動でテーブルなどが生成されるからです）
商品の状態・配送料の負担・発送元の地域・発送までの日数・カテゴリー
これらのカラムはActiveHashで実装の予定のため、カラム名末尾に_idをつけ、integer型にしておくと、この先実装を進めていく中でエラー発生を避けることができます。
| product_description | bigint | null: false |
こちらの商品説明欄は文章を保存させることが想定できますのでtext型にしておきましょう！
今回の実装では「1つの商品は1つの購入履歴を持っている」という設計にしたいため、has_oneを使用してあげましょう！
今回のアプリでは出品できる価格に上限が設定されている(非常に大きな数値にはならない)ため、integer型で実装してあげましょう！
都道府県は住所テーブルにおいてもactive_hashで実装するため、商品テーブルと同じモデルを使い回すことができます。
こちらもshipment_street_idというカラム名とし、integer型で実装してあげましょう！
has_one :purchases
purchasesは単数形にしておきましょう！
画像              image
品名              product
説明              product_description
カテゴリー         category
商品状態           status
配送料の負担        delivery_fee
発送元             shipment_street
発送までの日数      shipment_Day
価格              price
-->



## purchase table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |
### Association
- belongs_to :user
- has_one :address
<!-- 
belongs_toを使用するときは、対象のテーブル名を単数形にしましょう！
| items | references | foreign_key: true |
外部キーを取得するカラム名は、単数形にしましょう！
配送先を管理するテーブルを作成してみましょう！
見本アプリの購入画面を参考に作成いただくと実装がスムーズかと思われます。
こちら2つのテーブルに分けていただくと「1つのテーブルに1つの役割をもたせる」という実装が行えます。
1.購入を管理するテーブル(購入履歴を管理するテーブル)
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |
2.住所を管理するテーブル
| postal_code | string     | null: false       |
| region      | string     | null: false       |
| city        | string     | null: false       | 
| address     | string     | null: false       |
| building    | string     |                   | 
| phone       | string     | null: false       | 
＋
| 購入を管理するテーブル        | references | foreign_key: true |
(購入情報と住所情報を結びつけるため、住所テーブルには購入テーブルの外部キーカラムをつくります)
購入情報は１つの住所を持っている設計にしたいので、has_oneでアソシエーションを住所テーブルと組みましょう！
郵便番号     postal_code
都道府県     region  
市区町村     city
番地        address
建物        building
電話番号     phone
-->


## address table
| postal_code           | string     | null: false       |
| region                | string     | null: false       |
| city                  | string     | null: false       | 
| address               | string     | null: false       |
| building              | string     |                   | 
| phone                 | string     | null: false       | 
| shipment_street_id    | integer    | null: false       | 
### Association
- belongs_to :user
- belongs_to : items
- belongs_to : purchase
<!-- 
都道府県は住所テーブルにおいてもactive_hashで実装するため、商品テーブルと同じモデルを使い回すことができます。
こちらもshipment_street_idというカラム名とし、integer型で実装してあげましょう！
2.住所を管理するテーブル
| postal_code | string     | null: false       |
| region      | string     | null: false       |
| city        | string     | null: false       | 
| address     | string     | null: false       |
| building    | string     |                   | 
| phone       | string     | null: false       | 
＋
| 購入を管理するテーブル        | references | foreign_key: true |
(購入情報と住所情報を結びつけるため、住所テーブルには購入テーブルの外部キーカラムをつくります)
shipment_street_id
今回の設計では「配送先住所と購入管理が紐づく」実装を行なっていきたいので、商品やユーザーと配送先住所のアソシエーションは組まなくてもよいかと考えています。

・primary_key：プライマリキー
・string：文字列（1〜255文字）
・text：長い文字列（1〜4294967296文字）
・integer：整数（4バイト）
・bigint：整数（8バイト）
・float：浮動小数
・decimal：精度の高い少数
・numeric：数値
・datetime：日時
・timestamp：更新時間
・time：時間
・date：日付
・binary：バイナリーデータ
・boolean：真偽値 
-->