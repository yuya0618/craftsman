# Craftsman

![e1a4552a37fbe4aa7b44d084a4810591](https://user-images.githubusercontent.com/52994356/66021137-8685a680-e524-11e9-8136-1e523579b9e6.gif)


# Overview/概要
アイデアをシェアするプラットフォーム  
自由にアイデアを募集したり、思いついたアイデアをシェア出来るWebアプリケーションです。  
テーマは"集え、アイデア職人","たくさん寄れば文殊の知恵","誰かの妄想を、誰かが現実に"  

# Description/説明
世の中には実現をしない（出来ない）だけで、オモシロイアイディアを持っている人が山ほどいます。しかし、それを実際に行動に起こせている人は多くありません。  
行動を起こしたいけどアイディアが不十分な人に、世の中の多くいるアイデアマンが力を貸したら、世の中は更にオモシロくなるはず。  
そんなオモシロイアイデアのシェア・募集ができる場を作りたい！  
小さなしょうもないアイデアから、大きなビジネスに繋がるアイデアまで幅広く、いろんな人のいろんなアイデアを共有できる場を作りたい！と思い作りました。  


# Usage/使用法
新規登録　→　投稿可能に。  
Build　　→　募りたいお題を立ち上げる。  
           期間を決めて、BestIdeaを決める　⇨ 更に話を聞きたい場合はコンタクトをとる  
           報酬型募集も可能（期間と報酬を決めて募る）⇨ 質の良いアイデアをより多く募集したい人（企業）向け。  
Release　→　自由なテーマで自由なアイディア・思いつきを投稿する。  
           niceを集める、プレミアRelease  
nice　　　→　いいなと思った投稿・アイデアにniceを付ける。  

----------------------------------------------------------------------------  
ランキング→　BuildとReleaseランキング  
          　クラフトマンランキング  
             総合、年間、月間、週間NICE数ランキングなど。    
BestIdea　→　週間、月間nice数に応じてポイントをユーザに与える。  
グループ　　→　作成したグルーブ内で自由にアイデアを出したり、チャットが気軽にできる。  
DM機能　　　→　アイディアをくれた人に直接連絡を取りたい、会いたい場合に活用する。  
ポイント換金→　プレミア投稿・報酬・ランクアップボーナス等で稼いだポイントを換金できる。  


# User/利用者
○募集側（Builder) ⇨ アイディアを募集する事をBuild（アイディアの基盤を作る。そこに追加アイディアなどを募集する事）と言う。  
例）  
・起業したい人。⇨ こういうサービスを作りたい。追加サービスやウケそうなアイディアが欲しい。  
・商品企画部のリーマン ⇨ 企画開発のため尖ったアイディアが欲しい  
・商品企画の起業 ⇨ ユーザーの正直な声を聞きたい。バズる・利用者が本当に求めているものを募集。  
・面白い一発ギャグ、なぞなぞを募集。  
メリット⇨  
アイデアを募れる。自分に無い考えを知れる。  
  
○放出側（Craftsman） ⇨ アイディアを放出する事をReleaseすると言う。  
・いろんなアイディアを考えるのが好きな人。  
・いいねを貯めてCraftsmanとしての承認欲求を満たしたい人。  
⇨ ゆくゆくはプレミアReleaseで売買できるようにも（著名人のアイデアなど）  
メリット⇨  
・いいねを集めてレベルアップ⇨レベルアップやBestIdeaによるボーナス（換金可能)  
・空き時間のふとした思いつきでお小遣いが稼げる。承認欲求を満たせる。行き場のないアイデアを共有できる。暇つぶし。  
・プレミア投稿 or プレミアフォロー  


# Features/機能
・ログイン機能  
・Build(アイデア募集)投稿・編集・削除  
・Buildへの案投稿・編集・削除  
・Buildの案へのコメント投稿・編集・削除  
・Release（アイデアシェア）投稿・編集・削除  
・Releaseへのコメント投稿・編集・削除  
・nice機能（非同期）  
・ランキング機能  
  



# Will/今後実装したい機能
・グループ作成機能


# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :builds, dependent: :destroy
- has_many :releases, dependent: :destroy
- has_many :build_comments, dependent: :destroy
- has_many :build_ractions, dependent: :destroy
- has_many :release_comments, dependent: :destroy

## buildsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|string|null: false|
|reward|integer|null: false|
|best_idea|integer||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user ,optional: true
- has_many :build_comments, dependent: :destroy
- has_many :build_reactions, dependent: :destroy

## releasesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user ,optional: true
- has_many :release_comments, dependent: :destroy


## build_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|build_id|integer|null: false, foreign_key: true|
###Association
- belongs_to :user,optional: true
- belongs_to :build,optional: true
- has_many   :build_reactions, dependent: :destroy

## build_reactionsテーブル
|Column|Type|Options|
|------|----|-------|
|detail|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|build_id|integer|null: false, foreign_key: true|
|build_comment_id|integer|null: false, foreign_key: true|
###Association
- belongs_to :user,optional: true
- belongs_to :build,optional: true
- belongs_to :build_comment,optional: true

## release_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|detail|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|release_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user ,optional: true
- belongs_to :release ,optional: true

# Author/作者
https://www.wantedly.com/users/102386324
