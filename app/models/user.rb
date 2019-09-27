class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
