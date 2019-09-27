class Release < ApplicationRecord
  belongs_to :user ,optional: true
  has_many :release_comments, dependent: :destroy
  has_many :release_likes, dependent: :destroy

  validates :title, length: { maximum: 30 }


  # ユーザーがそのReleaseに既にいいねしてるかどうか
  def like_user(user_id)
    release_likes.find_by(user_id: user_id)
  end

end
