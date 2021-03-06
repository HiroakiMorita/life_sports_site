# README

# アプリ名

<p style="font-size: 23px">Life Sports Site</p>
<br>

![UNADJUSTEDNONRAW_thumb_60e](https://user-images.githubusercontent.com/53965957/67180230-ef6d8980-f413-11e9-8c3e-c57a840cf523.jpg)

# テストユーザー
email: sample@gmail.com<br>
Pass : aaaaaaa<br>
<br>

# 概要

様々なスポーツの総合マッチングサイトを作成しました。<br>
友人や知らない人とも繋がりを持ち、同じ趣味の人たちを繋げるサイトです。<br>
<br>
# 制作背景

私は、幼い頃からスポーツに携わってきました。<br>
私自身、水泳を30年以上続けてきて、スポーツは今まで生きてきた中で生活の一部となっていました。<br>
スポーツを通じて「喜び」や「悲しみ」「仲間」と巡り逢えた経験は今でも大切なモノです。<br>
このアプリを通じて同じ趣味を持った人同士が繋がり、其々スポーツをすることの「楽しみ」や「喜び」を<br>
提供出来る場になるのではないかと考えました。<br>
また、水泳以外にも様々なスポーツを取り入れることで利用者拡大に繋がると考えました。<br>
このアプリを作成することで、Ruby on Railsを総合的に復習でき、且つ新技術に挑戦することができると感じました。<br>
<br>
# 使用言語・フレームワーク

### フレームワーク
Ruby on Rails<br>
<br>
### マークアップ
HTML/SASS<br>
<br>

# 実装済み
  - ユーザー登録・ログイン・ログアウト・修正
  - メンバー(プロフィール)登録・修正
# 実装予定
  - チーム登録・修正・一覧表示・絞り込み検索
  - メンバー(プロフィール)一覧表示・絞り込み検索
  - メンバーとチームのチャット
  - チャットメッセージ送信時の非同期通信
  - チャットメッセージの自動更新
  - メンバーとチームの地域を登録
  - デプロイ(AWS)


# 今後の課題・追加予定機能

①投稿機能非同期通信で実装する予定です。<br>
②TwitterとGoogleで新規登録・ログイン出来るように機能を導入を予定しております。<br>


<br>
<br>

# Life_Sports_Site DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
### Association
- has_one :profile
- has_many :comments
- has_many :sns_credentials, dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|old|string|null: false|
|gender|integer|null: false|
|message|text|null: false|
|job|integer|null: false|
|holiday|integer|null: false|
|prefecture_id|bigint|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :sns_credentials, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|
|image|text|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :groups_users
- has_many :users, through: :groups_users

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

<!-- Twitter・GoogleのSNS認証用 -->
## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|uid|string||
|provider|string||
### Association
- belongs_to :user

<!-- 写真投稿 -->
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


