class CreateBuildComments < ActiveRecord::Migration[5.2]
  def change
    create_table :build_comments do |t|
      t.string     :title,              null: false
      t.string     :detail,             null: false
      t.references :build,              null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
