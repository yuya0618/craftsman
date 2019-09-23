# README

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
## Association
- has_many :builds
- has_many :releases
- has_many :build-comments
- has_many :release-comments

# buildsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|text|null: false|
|reward|integer|null: false|
|best_idea|integer||
|user_id|integer|null: false, foreign_key: true|
##Association
- has_many :build-comments
- belongs_to :user

# releasesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|detail|text|null: false|
|user_id|integer|null: false, foreign_key: true|
##Association
- has_many :release-comments
- belongs_to :user

# build-commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|build_id|integer|null: false, foreign_key: true|
##Association
- belongs_to :user
- belongs_to :build

# release-commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|release_id|integer|null: false, foreign_key: true|
##Association
- belongs_to :user
- belongs_to :release