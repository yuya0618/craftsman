class RemoveLikesCountFromBuildComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :build_comments, :likes_count, :integer
  end
end
