class RemoveRewardFromBuilds < ActiveRecord::Migration[5.2]
  def change
    remove_column :builds, :reward, :integer
  end
end
