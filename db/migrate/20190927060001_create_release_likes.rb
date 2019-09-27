class CreateReleaseLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :release_likes do |t|
      t.references :release, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
