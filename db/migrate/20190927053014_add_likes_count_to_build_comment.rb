class AddLikesCountToBuildComment < ActiveRecord::Migration[5.2]
  def change
    add_column :build_comments, :likes_count, :integer
  end
end
