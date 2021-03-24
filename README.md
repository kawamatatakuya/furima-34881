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
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| street             | string              | null: false             |
### Association
* has_many :items
* has_many :purchase


## items table
| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product                             | string     | null: false       |
| price                               | string     | null: false       |
| summary                             | text       | null: false       |
| user                                | references | foreign_key: true |
### Association
- belongs_to :user
- has_many :purchase


## purchase table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| items       | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to : items


<!-- 
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