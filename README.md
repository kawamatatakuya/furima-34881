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
| birth_date         | string              | null: false             |
### Association
* has_many :items
* has_many :purchases
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

住所は分ける？そもそもここの項目？
都道府県     region  
地域以下住所  address 
| region             | string              | null: false             |
| address            | string              | null: false             | 
-->


## items table
| Column                 | Type       | Options           |
|------------------------|------------|-------------------|
| image                  |            | null: false       |
| product                | string     | null: false       |
| product_description    | bigint     | null: false       |
| category               | string     | null: false       |
| status                 | string     | null: false       |
| delivery_fee           | string     | null: false       |
| shipment_street        | string     | null: false       |
| shipment_Day           | bigint     | null: false       |
| price                  | bigint     | null: false       |
| user                   | references | foreign_key: true |
### Association
- belongs_to :user
- has_many :purchases
<!-- 
| price | string | null: false |
コン学は、数値で登録できるように、データ型を変更しましょう！
itemsテーブルにプルダウンから選択するデータを保存するカラムが足りません。
見本アプリをご確認いただき、カラムを追加しましょう！
has_manyを使用するときは、対象のテーブル名を複数形にしましょう！ 

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
- belongs_to : item
<!-- 
belongs_toを使用するときは、対象のテーブル名を単数形にしましょう！
| items | references | foreign_key: true |
外部キーを取得するカラム名は、単数形にしましょう！


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