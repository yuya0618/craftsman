class BuildReaction < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :build ,optional: true
  belongs_to :build_comment ,optional: true
end
