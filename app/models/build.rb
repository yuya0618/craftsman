class Build < ApplicationRecord
  belongs_to :user ,optional: true
  has_many :build_comments, dependent: :destroy
  has_many :build_reactions, dependent: :destroy
end
