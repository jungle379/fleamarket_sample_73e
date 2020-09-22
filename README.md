# README

🐾 README<br>
💻 アプリ名<br>
FURIMA<br>
🌐 URL<br>
http://18.180.236.160/

■ Basic認証
ID：furima<br>
Pass：73e


🎈 トップページ

💡 制作背景
家にある使っていない物が、誰かにとって必要な物かもしれません。
シンプルで使いやすいフリマアプリがあれば気軽に初めることができ、必要な人の元へお届けしやすいのではと考えて制作しました。

🔰 説明
フリマーケットサイトの模擬サイトです。 実際に販売等はできませんが、以下の機能を動かすことができます。

ユーザー登録・ログイン
商品出品
出品した商品情報の編集
出品した商品の削除
商品の詳細情報の確認
商品の購入
クレジットカードの登録
🌟 使い方
トップページ・商品詳細ページの閲覧のみであればログインは不要です
出品・編集・削除はログインが必要です
購入はログインとクレジットカード登録が必要です
🔒 閲覧用
■ テスト用アカウント
◯ 購入者用
メールアドレス：mochi@mail
パスワード：mochi00


◯ 購入用カード情報
番号：4242424242424242
期限：01/21
セキュリティコード：111


◯ 出品者用
メールアドレス：yasu@gmail
パスワード：ya0000


✒️ 構築
$ git clone https://github.com/jungle379/fleamarket_sample_73e
$ cd fleamarket_sample_72a
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
http://localhost:3000

⚠️ ライセンス
MIT

# fleamarket_sample_73e DB設計
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_code|string|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|telephone_number|string|unique: true|
### Association
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|
## Association
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null :false|
|content|text|null :false|
|category_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|brand|string||
|preparation_day|integer|null: false|
|postage_type|integer|null: false|
|postage_payer|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|prefecture_id(active_hash)|integer|null: false|
### Association
- belongs_to :user
- belongs_to :category
- has_many :images
- belongs_to :prefecture

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :items
- has_one :profile
- has_one :address
- has_one :credit_card
