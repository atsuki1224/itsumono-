# itsumono DB設計

アプリ名
====
### いつもの
https://itsumono.herokuapp.com/
  
限られた時間、家族との時間を大切にしよう
  
## 概要
"いつもの"は家庭で使用している日用品を分かりやすく共有することで  
家族の誰でも間違えずに買い足しができるようにするツールです  
  
"夫にお使いを頼むと必ず間違えてしまう"  
"共働きなのに日用品や食品の買い出しはいつお私が担当"  
そんな意見が多いことにふと目がつきました  
  
共働き家庭が増えている現代、家事を夫婦で効率よく行えたら家族との大切な時間がより増えることでしょう  
夫も家事に参加したいけれど"間違えるとかえって迷惑をかけてしまう"そんな意見もあると思います  
  
"いつもの"は日用品を共有することで、家族の時間い寄り添うことを目指します  

## 工夫したポイント
・進捗管理ツール「Trello」にて管理しつつ開発  
・使用したことのなかったHerokuを利用してのデプロイ  
・HerokuのデフォルトデータベースをpostgresqlからMysqlへ変更  
・投稿したアイテムはユーザーではなくグループに紐づけることでユーザー退会後も投稿が消えないようにした  
・sessionを利用してgroup_idを取得しアイテムと紐づけてデータベースに保存させている  
・開発の手間を短縮するために「簡単ログインボタン」を実装しログインをスムーズに行えるようにした  
・今までgithub desktopを使用していたが、ターミナル操作に慣れるためpull request以外はターミナルから操作した  

## 機能一覧
・ユーザー新規登録機能  
・ユーザーログイン機能  
・簡単ログイン機能  
・グループ作成機能  
・グループ編集/削除機能  
・アイテム投稿機能  

## 機能説明
トップページ  
<img src="https://github.com/atsuki1224/itsumono-/blob/readme_edit/top.png" width=50%>  
  
  
ログイン  
<img src="https://github.com/atsuki1224/itsumono-/blob/readme_edit/login.png" width=50%>  
  
  
簡単ログイン  
<img src="https://github.com/atsuki1224/itsumono-/blob/readme_edit/login_shortcut.gif" width=50%>  
  
  
グループ作成  
<img src="https://github.com/atsuki1224/itsumono-/blob/readme_edit/group.png" width=50%>  
  
  
アイテム一覧  
<img src="https://github.com/atsuki1224/itsumono-/blob/readme_edit/item.gif" width=50%>  
  
## 使用している技術
・Ruby 2.5.1  
・Mysql2 0.5.2  
・Heroku(mysql2を使用)  
・scss(sass記法)  
・haml  
・pry-rails  
・devise  
・session

## 今後実装したい機能
・アイテムをジャンル別に表示させる機能  
・Google map APIを使用してアイテムと住所を紐づける  
　その商品が一番安く近所のスーパーを分かりやすく共有することができる  
・グループの検索機能  
・ユーザーの検索とグループへの招待機能  
・Javascriptを使用してページを遷移せずにジャンル毎にビューを切り替える  

# テスト
・後ほど記入  


## データベース設計
<img src="https://github.com/atsuki1224/itsumono-/blob/master/Entity%20Relationship%20Diagram.png" width=50%>

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
|name|string|null: false|
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
|name|string|null: false|
|item_id|integer|foreign_key: true|
### Association
 - has_many :items