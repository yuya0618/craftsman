class Release < ApplicationRecord
  belongs_to :user ,optional: true
  has_many :release_comments, dependent: :destroy
end
