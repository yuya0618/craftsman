class BuildCommentLike < ApplicationRecord
  belongs_to :build_comment
  belongs_to :user
end
