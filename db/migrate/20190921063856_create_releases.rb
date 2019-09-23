class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string     :title,              null: false
      t.string     :detail,             null: false, unique: true
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
