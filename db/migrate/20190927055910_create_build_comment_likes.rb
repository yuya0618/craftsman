class CreateBuildCommentLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :build_comment_likes do |t|
      t.references :build_comment, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
