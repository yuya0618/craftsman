class AddLikesCountToRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :likes_count, :integer
  end
end
