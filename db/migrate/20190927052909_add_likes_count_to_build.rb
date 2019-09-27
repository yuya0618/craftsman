class AddLikesCountToBuild < ActiveRecord::Migration[5.2]
  def change
    add_column :builds, :likes_count, :integer
  end
end
