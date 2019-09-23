class CreateBuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :builds do |t|
      t.string     :title,              null: false
      t.string     :detail,             null: false, unique: true
      t.integer    :reward,             null: false
      t.integer    :best_idea
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
