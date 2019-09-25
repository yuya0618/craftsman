class CreateBuildReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :build_reactions do |t|
      t.string     :detail,             null: false
      t.references :build,              null: false, foreign_key: true
      t.references :build_comment,      null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
