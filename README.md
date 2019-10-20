# README

## 機能一覧
  ### 実装済み
    - 
    - ユーザー登録・ログイン・ログアウト・修正
    - メンバー(プロフィール)登録・修正・一覧表示・絞り込み検索
    - チーム登録・修正・一覧表示・絞り込み検索
  
  ### 実装予定

    - メンバーとチームのチャット
    - チャットメッセージ送信時の非同期通信
    - チャットメッセージの自動更新
    - メンバーとチームの地域を登録

## 使用技術
  - Ruby on Rails
  - Javascript
  - haml,scss,bootstrap


# sports_site DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
### Association
- has_one :profile
- has_many :comments

## profilesテーブル
|old|string|null: false|
|gender|string|null: false|
|message|string|null: false|
|prefecture_id|references|null: false, foreign_key: true|
### Association
- has_one :user
- has_many :sns_credentials, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|string|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
### Association
- has_many :comments
- has_many :groups_users
- has_many :users, through: :groups_users

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user


<!-- Facebook等のSNS認証用 -->
## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|uid|string||
|provider|string||
### Association
- belongs_to :user

<!-- 1つのitemに対して複数のimageが設定できてしまうため -->
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user

