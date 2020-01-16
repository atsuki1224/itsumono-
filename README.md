# itsumono DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: failse, unique: true|
|users_groups_id|integer|foreign_key: true|
### Association
 - has_many :users_groups
 - has_many :groups, through: :users_groups

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|group_id|integer|null :false, foreign_key: true|
### Association
 - belongs_to :user
 - belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|groupname|string|null: false|
|users_groups_id|integer|null: false, foreign_key: true|
|item_id|integer|foreign_key: true|
### Association
 - has_many :users_groups
 - has_many :users, through: :users_groups
 - has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|image|string|null: false|
|capacity|string|null: false|
|comment|text||
|group_id|integer|null: false, foreign_key: true|
|genre_id|integer|null: false, foreign_key: true|
### Association
 - belongs_to :group
 - belongs_to :genre

## genreテーブル
|Column|Type|Options|
|------|----|-------|
|genre_name|string|null: false|
|item_id|integer|foreign_key: true|
### Association
 - has_many :items
 