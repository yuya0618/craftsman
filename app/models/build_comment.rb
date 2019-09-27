class BuildComment < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :build ,optional: true
  has_many   :build_reactions, dependent: :destroy
  has_many :build_comment_likes, dependent: :destroy

  # ユーザーがそのBuild_commentに既にいいねしてるかどうか
  def build_comment_like_user(user_id)
    build_comment_likes.find_by(user_id: user_id)
  end

end
