# アプリ名
## UMIGAME

# ゲーム説明
- ウミガメのスープという水平思考のコミュニケーション型ゲーム
- 出題者が問題を出題し、回答者はYESかNOで答えられる質問をする<br>例. ◯それは生き物ですか？ <br>    ×それはなんという生き物ですか？
- 出題者はYESかNOで回答し、時折ヒントなどで正解へ導く
- グループメンバーで正解の状況を思考する、というゲーム

# URL
- http://35.75.250.100/

# 目的
- コミュニケーションを取りながら、親しい友人・知人数人で遊べるゲームを作ってみたいと思ったから。

# 意識したこと
- なるべくロードを挟まずに、リアルタイムにチャットができるシステムを作りたかった。
- 楽しそうな雰囲気を意識しつつ、文字を見やすくすることを心掛けた。

# 機能紹介
## 新規登録 → ログアウト → トップページ
![新規登録・ログアウト](https://user-images.githubusercontent.com/84889081/131308061-2cad1cff-e15e-4b49-9386-426acf4ac6cd.gif)
- ユーザー管理機能はdeviseを使用
## ログイン
![ログイン](https://user-images.githubusercontent.com/84889081/131308496-4adb0387-72a4-41f0-9245-78da6f00693b.gif)

## ルーム作成
![ルーム作成](https://user-images.githubusercontent.com/84889081/131308547-4383b5d4-4f62-4dfc-982b-4861d6f5407a.gif)

## ルーム検索 → 参加
![ルーム参加](https://user-images.githubusercontent.com/84889081/131308599-f0dd8f65-15e7-4a21-bc40-5ed56c47363a.gif)
- 検索機能にransackを使用
## 問題出題
![問題出題](https://user-images.githubusercontent.com/84889081/131308673-0d5b26d3-d90b-4ec6-b151-588141b42da5.gif)
- ActionCableを使用し、非同期通信での表示を実現。※ただし、課題あり（後述）
## コメント（質問・返信）
![コメント](https://user-images.githubusercontent.com/84889081/131308727-572da96c-2b18-4188-be84-ccb5089579d7.gif)
- ActionCableを使用し、非同期通信での表示を実現。※ただし、課題あり（後述）
## 問題削除
![問題削除](https://user-images.githubusercontent.com/84889081/131308786-7079250c-a293-458e-850e-2e760c8e7490.gif)
- ActionCableを使用し、非同期通信での表示を実現。※ただし、課題あり（後述）


# 今後の課題について
![課題](https://user-images.githubusercontent.com/84889081/131308825-2d79b7c4-56b5-45b0-b27c-d46860de7411.gif)
- 問題出題後、リロードを挟まなければ出題者に模範解答が表示されない。（ActionCableにcurrent_userの情報を持ってきて条件分岐する必要がある。）
- リロードを挟むと、問題選択のプルダウンが表示されてしまう。
- コメントで長文を入力すると、画面サイズによっては質問と解答の幅がずれてしまう。
- 問題削除時に、リロードをしていないとリアルタイムに問題が消えず、残ってしまう。


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
- has_many :questions


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
| title           | text       | null: false                    |

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

## questions テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| q_content       | text       | null: false                    |
| q_answer        | text       | null: false                    |
| title           | text       | null: false                    |
| room            | references | null: false, foreign_key: true |

### Association
- belongs_to :room