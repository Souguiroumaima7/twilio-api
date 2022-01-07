ActiveRecord::Schema.define(version: 2021_01_07_203512) do

    create_table "announcements", force: :cascade do |t|
      t.datetime "published_at"
      t.string "announcement_type"
      t.string "name"
      t.text "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "conversations", force: :cascade do |t|
      t.integer "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["user_id"], name: "index_conversations_on_user_id"
    end
  
    create_table "friendly_id_slugs", force: :cascade do |t|
      t.string "slug", null: false
      t.integer "sluggable_id", null: false
      t.string "sluggable_type", limit: 50
      t.string "scope"
      t.datetime "created_at"
      t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
      t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
      t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
    end
  
    create_table "messages", force: :cascade do |t|
      t.integer "conversation_id", null: false
      t.integer "user_id", null: false
      t.text "body"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["conversation_id"], name: "index_messages_on_conversation_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
  
    create_table "notifications", force: :cascade do |t|
      t.bigint "recipient_id"
      t.bigint "actor_id"
      t.datetime "read_at"
      t.string "action"
      t.bigint "notifiable_id"
      t.string "notifiable_type"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "services", force: :cascade do |t|
      t.integer "user_id", null: false
      t.string "provider"
      t.string "uid"
      t.string "access_token"
      t.string "access_token_secret"
      t.string "refresh_token"
      t.datetime "expires_at"
      t.text "auth"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["user_id"], name: "index_services_on_user_id"
    end
  
    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "first_name"
      t.string "last_name"
      t.datetime "announcements_last_read_at"
      t.boolean "admin", default: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "phone"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  
    add_foreign_key "conversations", "users"
    add_foreign_key "messages", "conversations"
    add_foreign_key "messages", "users"
    add_foreign_key "services", "users"
  end