class RemoveLikesCountFromBuilds < ActiveRecord::Migration[5.2]
  def change
    remove_column :builds, :likes_count, :integer
  end
end
