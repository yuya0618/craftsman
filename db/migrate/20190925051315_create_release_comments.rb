class CreateReleaseComments < ActiveRecord::Migration[5.2]
  def change
    create_table :release_comments do |t|
      t.string     :detail,             null: false
      t.references :release,            null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
