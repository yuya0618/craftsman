class User < ApplicationRecord
  mount_uploader :icon, IconUploader
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :builds, dependent: :destroy
  has_many :releases, dependent: :destroy
  has_many :build_comments, dependent: :destroy
  has_many :build_reactions, dependent: :destroy
  has_many :release_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :build_comment_likes, dependent: :destroy
  has_many :release_likes, dependent: :destroy

  validates :name, length: { maximum: 8 }
  validates :text, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 200 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # buildにNICEしてるかどうか
  def already_liked?(build)
    self.likes.exists?(build_id: build.id)
  end

  # build_commentにNICEしてるかどうか
  def build_comment_already_liked?(build_comment)
    self.build_comment_likes.exists?(build_comment_id: build_comment.id)
  end

  # releaseにNICEしてるかどうか
  def release_already_liked?(release)
    self.release_likes.exists?(release_id: release.id)
  end

end
