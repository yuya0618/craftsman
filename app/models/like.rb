class Like < ApplicationRecord
  belongs_to :build, counter_cache: :likes_count
  belongs_to :user
end
