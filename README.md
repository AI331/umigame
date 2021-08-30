# 概要

## UMIGAME
### ゲーム説明
- ウミガメのスープという水平思考のコミュニケーション型ゲーム
- 出題者が問題を出題し、回答者はYESかNOで答えられる質問をする
- 出題者はYESかNOで回答し、時折ヒントなどで正解へ導く
- 制限時間内に正解の状況を当てることができるか、というゲーム

### URS
- http://35.75.250.100/

### トップページ
![](https://i.gyazo.com/bed096aede66e8ac79cf109c8aa4a628.jpg)





# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :comments

## rooms テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |
| quiz               | references  | null: false, foreign_key: true |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- has_many :comments
- has_many :quiz_rooms
- has_many :quizzes, through: :quiz_rooms


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| room          | references | null: false, foreign_key: true |
| comment       | text       | null: false                    |
| message       | reference  | null: false                    |

### Association

- belongs_to :user
- belongs_to :room
- belongs_to :message

## messages テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| room               | references | null: false, foreign_key: true |
| messages_content   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :room
- has_many :comments 


## quizzes テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| quizzes_content | text       | null: false                    |
| answer          | text       | null: false                    |

### Association

- has_many :quiz_rooms
- has_many :rooms, through: :quiz_rooms



## quiz_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| quiz   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :quiz