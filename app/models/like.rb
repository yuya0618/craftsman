class Like < ApplicationRecord
  belongs_to :build
  belongs_to :user
end
