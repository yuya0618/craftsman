# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_25_055525) do

  create_table "build_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "detail", null: false
    t.bigint "build_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_id"], name: "index_build_comments_on_build_id"
    t.index ["user_id"], name: "index_build_comments_on_user_id"
  end

  create_table "build_reactions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "detail", null: false
    t.bigint "build_id", null: false
    t.bigint "build_comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_comment_id"], name: "index_build_reactions_on_build_comment_id"
    t.index ["build_id"], name: "index_build_reactions_on_build_id"
    t.index ["user_id"], name: "index_build_reactions_on_user_id"
  end

  create_table "builds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "detail", null: false
    t.integer "reward", null: false
    t.integer "best_idea"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_builds_on_user_id"
  end

  create_table "release_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "detail", null: false
    t.bigint "release_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_release_comments_on_release_id"
    t.index ["user_id"], name: "index_release_comments_on_user_id"
  end

  create_table "releases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "detail", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_releases_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "build_comments", "builds"
  add_foreign_key "build_comments", "users"
  add_foreign_key "build_reactions", "build_comments"
  add_foreign_key "build_reactions", "builds"
  add_foreign_key "build_reactions", "users"
  add_foreign_key "builds", "users"
  add_foreign_key "release_comments", "releases"
  add_foreign_key "release_comments", "users"
  add_foreign_key "releases", "users"
end
