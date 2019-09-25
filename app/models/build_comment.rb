class BuildComment < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :build ,optional: true
  has_many   :build_reactions, dependent: :destroy
end
