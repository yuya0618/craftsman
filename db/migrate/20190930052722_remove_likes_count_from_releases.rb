class RemoveLikesCountFromReleases < ActiveRecord::Migration[5.2]
  def change
    remove_column :releases, :likes_count, :integer
  end
end
