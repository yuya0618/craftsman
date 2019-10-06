class Build < ApplicationRecord
  belongs_to :user ,optional: true
  has_many :build_comments, dependent: :destroy
  has_many :build_reactions, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30 }
  validates :detail, presence: true, length: { maximum: 500 }
  validates :reward, presence: true
end
