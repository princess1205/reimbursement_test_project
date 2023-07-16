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

ActiveRecord::Schema.define(version: 2023_07_10_174458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "dblink"
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "postgres_fdw"

  create_table "account_time_zones", force: :cascade do |t|
    t.string "time_zone_name", limit: 255
    t.string "time_zone_value", limit: 255
    t.integer "time_zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "account_type"
    t.binary "profile_picture"
    t.text "about_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "language", limit: 255
    t.bigserial "user_id", null: false
    t.text "about_me"
  end

  create_table "action_categorys", force: :cascade do |t|
    t.string "category_name", limit: 255
    t.integer "criteria_id"
    t.integer "category_type"
    t.integer "score"
    t.integer "subsequence_score", default: -1
    t.integer "num_action_count"
    t.boolean "is_progressive"
    t.boolean "push_to_crm_as_notes"
    t.integer "progressive_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_notifications", force: :cascade do |t|
    t.integer "user_id"
    t.string "message", limit: 255
    t.string "image", limit: 255
    t.string "link", limit: 255
    t.boolean "viewed"
    t.integer "asset_id"
    t.integer "notify_by"
    t.string "msg_id", limit: 255
    t.datetime "expiry_time"
    t.datetime "viewed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "notification_type"
    t.integer "notification_type_id"
    t.boolean "open_in_new_tab"
    t.integer "msg_type"
    t.index ["msg_type"], name: "index_activity_notifications_on_msg_type"
  end

  create_table "activity_requests", force: :cascade do |t|
    t.string "request_path", limit: 255
    t.string "request_method", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "activity_type", default: 1
    t.index ["activity_type"], name: "index_activity_requests_on_activity_type"
    t.index ["request_method"], name: "index_activity_requests_on_request_method"
    t.index ["request_path"], name: "index_activity_requests_on_request_path"
  end

  create_table "activity_trackers", force: :cascade do |t|
    t.integer "org_user_id"
    t.string "request_path", limit: 255
    t.string "request_method", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addon_features", force: :cascade do |t|
    t.integer "addon_group_id"
    t.integer "feature_id"
    t.string "values", limit: 255
    t.boolean "is_unit_based"
  end

  create_table "addon_groups", force: :cascade do |t|
    t.string "name", limit: 255
    t.boolean "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "addon_type", default: 0
  end

  create_table "annotations", primary_key: "cta_components_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "annotation_text"
    t.text "annotation_url"
    t.integer "end_time"
    t.datetime "updated_at"
  end

  create_table "announcement_notifications", force: :cascade do |t|
    t.integer "added_by"
    t.integer "plan_type", default: [], array: true
    t.string "message", limit: 255
    t.string "image", limit: 255
    t.string "link", limit: 255
    t.integer "notify_by"
    t.string "msg_id", limit: 255
    t.datetime "expiry_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "segment", limit: 255
  end

  create_table "answer_choices", primary_key: ["quiz_component_id", "answer_order"], force: :cascade do |t|
    t.bigint "quiz_component_id", null: false
    t.string "answer", limit: 255
    t.integer "answer_order", null: false
    t.boolean "case_sensitive"
    t.bigint "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["quiz_component_id", "answer_id"], name: "index_answer_choices_on_quiz_component_id_and_answer_id", unique: true
  end

  create_table "application_error_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "controller_name", limit: 255
    t.string "method_name", limit: 255
    t.string "exception_class", limit: 255
    t.text "error_msg"
    t.integer "error_code"
    t.bigint "thread_id"
    t.text "back_trace"
    t.datetime "entry_time"
    t.text "request"
    t.integer "service_id", default: 1
    t.string "request_ip", limit: 255, default: [], array: true
  end

  create_table "appsumo_activities", force: :cascade do |t|
    t.integer "action"
    t.string "plan_id", limit: 255
    t.string "uuid", limit: 255
    t.string "activation_email", limit: 255
    t.string "invoice_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "command"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "asset_group_details", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "primary_asset_id"
    t.string "product_name", limit: 255
    t.bigint "child_assets", array: true
    t.json "assets_info"
    t.json "user_info"
    t.integer "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index "to_tsvector('english'::regconfig, (COALESCE(product_name, ''::character varying))::text)", name: "agd_prod_name_idx", using: :gin
    t.index ["primary_asset_id"], name: "index_asset_group_details_on_primary_asset_id"
    t.index ["status"], name: "index_asset_group_details_on_status"
    t.index ["tenant_id"], name: "index_asset_group_details_on_tenant_id"
  end

  create_table "asset_location_details", force: :cascade do |t|
    t.bigint "asset_id"
    t.string "latitude", limit: 255
    t.string "longitude", limit: 255
    t.string "city", limit: 255
    t.integer "city_id"
    t.string "country", limit: 255
    t.string "remote_ip", limit: 255
    t.string "referer", limit: 255
    t.bigint "tenant_id"
    t.index ["asset_id"], name: "index_asset_location_details_on_asset_id"
    t.index ["tenant_id"], name: "index_asset_location_details_on_tenant_id"
  end

  create_table "asset_mapping_details", force: :cascade do |t|
    t.bigint "asset_id"
    t.integer "asset_type"
    t.bigint "tenant_id"
    t.json "mapping_details", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["asset_id"], name: "index_asset_mapping_details_on_asset_id"
    t.index ["tenant_id"], name: "index_asset_mapping_details_on_tenant_id"
  end

  create_table "asset_mapping_temp_table", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "tenant_id"
    t.bigint "stats_id"
    t.integer "folder_id"
    t.integer "asset_type"
  end

  create_table "asset_media_versions", primary_key: ["authoring_asset_id", "media_id"], force: :cascade do |t|
    t.integer "authoring_asset_id", null: false
    t.integer "media_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asset_sharing_infos", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "asset_entity_type"
    t.integer "asset_entity_id"
    t.integer "shared_entity_type"
    t.integer "shared_entity_id"
    t.integer "shared_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "privacy_type"
    t.index ["asset_entity_type", "asset_entity_id"], name: "add_index_asset_sharing_info_by_asset_type_and_asset_ids"
    t.index ["shared_entity_type", "shared_entity_id"], name: "add_index_asset_sharing_info_by_sharing_type_and_sharing_ids"
    t.index ["tenant_id"], name: "index_asset_sharing_infos_on_tenant_id"
  end

  create_table "asset_skip_stats", force: :cascade do |t|
    t.bigint "authoring_asset_id"
    t.integer "video_delivery_stats_id"
    t.integer "play_start_second"
    t.integer "play_end_second"
    t.datetime "play_start_time_utc"
    t.datetime "play_end_time_utc"
    t.bigint "tenant_id"
    t.datetime "updated_at"
    t.index ["authoring_asset_id"], name: "index_asset_skip_stats_on_authoring_asset_id"
    t.index ["tenant_id"], name: "index_asset_skip_stats_on_tenant_id"
    t.index ["video_delivery_stats_id"], name: "index_asset_skip_stats_on_video_delivery_stats_id"
  end

  create_table "asset_source_language_transcriptions", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "media_id"
    t.string "language", limit: 255
    t.string "s3bucket", limit: 255
    t.string "s3key", limit: 255
    t.integer "word_count"
  end

  create_table "asset_stats", primary_key: "authoring_asset_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "num_edit"
    t.integer "num_preview"
    t.integer "total_preview_size"
    t.integer "total_render_size"
    t.float "elapsed_time_preview"
    t.float "elapsed_time_render"
    t.datetime "render_start_time"
    t.datetime "preview_start_time"
    t.float "total_preview_duration"
    t.float "total_render_duration"
    t.float "compress_time", default: 0.0
    t.integer "compress_start_time", default: 0
  end

  create_table "asset_system_defaults", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "asset_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id", "asset_id"], name: "index_asset_system_defaults_on_tenant_id_and_asset_id", unique: true
    t.index ["tenant_id"], name: "index_asset_system_defaults_on_tenant_id"
  end

  create_table "asset_ticket_details", primary_key: "authoring_asset_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "ticket_status", default: 0
  end

  create_table "asset_tracking_details", force: :cascade do |t|
    t.bigint "asset_id"
    t.bigint "selected_script_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "deleted_by"
    t.integer "watch_count", array: true
    t.json "default_shorten_ids"
    t.boolean "is_first_asset", default: false
    t.string "log_uid", limit: 255
    t.json "tracking_params"
    t.index ["asset_id"], name: "index_asset_tracking_details_on_asset_id"
  end

  create_table "asset_view_time_stats", force: :cascade do |t|
    t.bigint "authoring_asset_id"
    t.integer "video_minute"
    t.json "second_data"
    t.bigint "tenant_id"
    t.datetime "updated_at"
    t.index ["authoring_asset_id", "video_minute"], name: "asset_view_time_stats_idx_1"
  end

  create_table "asset_watch_rate_stats", force: :cascade do |t|
    t.integer "authoring_asset_id"
    t.integer "video_delivery_stats_id"
    t.integer "percentage_watched"
    t.index ["video_delivery_stats_id"], name: "asset_watch_rate_stats_idx_1"
  end

  create_table "assets_to_be_deleted", id: :serial, force: :cascade do |t|
    t.integer "asset_id"
    t.integer "authoring_id"
    t.integer "media_id"
    t.datetime "expiry_at"
    t.string "email", limit: 255
    t.integer "tenant_id"
    t.integer "asset_type"
    t.bigint "user_id"
    t.integer "page_id"
    t.index ["asset_id"], name: "index_assets_to_be_deleted_on_asset_id"
  end

  create_table "author_states", force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
  end

  create_table "author_states_1", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_1_authoring_id_idx"
    t.index ["id"], name: "author_states_1_id_idx"
    t.index ["state"], name: "author_states_1_state_idx"
    t.index ["tenant_id"], name: "author_states_1_tenant_id_idx"
  end

  create_table "author_states_10", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_10_authoring_id_idx"
    t.index ["id"], name: "author_states_10_id_idx"
    t.index ["state"], name: "author_states_10_state_idx"
    t.index ["tenant_id"], name: "author_states_10_tenant_id_idx"
  end

  create_table "author_states_11", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_11_authoring_id_idx"
    t.index ["id"], name: "author_states_11_id_idx"
    t.index ["state"], name: "author_states_11_state_idx"
    t.index ["tenant_id"], name: "author_states_11_tenant_id_idx"
  end

  create_table "author_states_12", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_12_authoring_id_idx"
    t.index ["id"], name: "author_states_12_id_idx"
    t.index ["state"], name: "author_states_12_state_idx"
    t.index ["tenant_id"], name: "author_states_12_tenant_id_idx"
  end

  create_table "author_states_13", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_13_authoring_id_idx"
    t.index ["id"], name: "author_states_13_id_idx"
    t.index ["state"], name: "author_states_13_state_idx"
    t.index ["tenant_id"], name: "author_states_13_tenant_id_idx"
  end

  create_table "author_states_14", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_14_authoring_id_idx"
    t.index ["id"], name: "author_states_14_id_idx"
    t.index ["state"], name: "author_states_14_state_idx"
    t.index ["tenant_id"], name: "author_states_14_tenant_id_idx"
  end

  create_table "author_states_15", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_15_authoring_id_idx"
    t.index ["id"], name: "author_states_15_id_idx"
    t.index ["state"], name: "author_states_15_state_idx"
    t.index ["tenant_id"], name: "author_states_15_tenant_id_idx"
  end

  create_table "author_states_16", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_16_authoring_id_idx"
    t.index ["id"], name: "author_states_16_id_idx"
    t.index ["state"], name: "author_states_16_state_idx"
    t.index ["tenant_id"], name: "author_states_16_tenant_id_idx"
  end

  create_table "author_states_17", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_17_authoring_id_idx"
    t.index ["id"], name: "author_states_17_id_idx"
    t.index ["state"], name: "author_states_17_state_idx"
    t.index ["tenant_id"], name: "author_states_17_tenant_id_idx"
  end

  create_table "author_states_18", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_18_authoring_id_idx"
    t.index ["id"], name: "author_states_18_id_idx"
    t.index ["state"], name: "author_states_18_state_idx"
    t.index ["tenant_id"], name: "author_states_18_tenant_id_idx"
  end

  create_table "author_states_19", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_19_authoring_id_idx"
    t.index ["id"], name: "author_states_19_id_idx"
    t.index ["state"], name: "author_states_19_state_idx"
    t.index ["tenant_id"], name: "author_states_19_tenant_id_idx"
  end

  create_table "author_states_2", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_2_authoring_id_idx"
    t.index ["id"], name: "author_states_2_id_idx"
    t.index ["state"], name: "author_states_2_state_idx"
    t.index ["tenant_id"], name: "author_states_2_tenant_id_idx"
  end

  create_table "author_states_20", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_20_authoring_id_idx"
    t.index ["id"], name: "author_states_20_id_idx"
    t.index ["state"], name: "author_states_20_state_idx"
    t.index ["tenant_id"], name: "author_states_20_tenant_id_idx"
  end

  create_table "author_states_3", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_3_authoring_id_idx"
    t.index ["id"], name: "author_states_3_id_idx"
    t.index ["state"], name: "author_states_3_state_idx"
    t.index ["tenant_id"], name: "author_states_3_tenant_id_idx"
  end

  create_table "author_states_4", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_4_authoring_id_idx"
    t.index ["id"], name: "author_states_4_id_idx"
    t.index ["state"], name: "author_states_4_state_idx"
    t.index ["tenant_id"], name: "author_states_4_tenant_id_idx"
  end

  create_table "author_states_5", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_5_authoring_id_idx"
    t.index ["id"], name: "author_states_5_id_idx"
    t.index ["state"], name: "author_states_5_state_idx"
    t.index ["tenant_id"], name: "author_states_5_tenant_id_idx"
  end

  create_table "author_states_6", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_6_authoring_id_idx"
    t.index ["id"], name: "author_states_6_id_idx"
    t.index ["state"], name: "author_states_6_state_idx"
    t.index ["tenant_id"], name: "author_states_6_tenant_id_idx"
  end

  create_table "author_states_7", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_7_authoring_id_idx"
    t.index ["id"], name: "author_states_7_id_idx"
    t.index ["state"], name: "author_states_7_state_idx"
    t.index ["tenant_id"], name: "author_states_7_tenant_id_idx"
  end

  create_table "author_states_8", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_8_authoring_id_idx"
    t.index ["id"], name: "author_states_8_id_idx"
    t.index ["state"], name: "author_states_8_state_idx"
    t.index ["tenant_id"], name: "author_states_8_tenant_id_idx"
  end

  create_table "author_states_9", id: false, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "state"
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.bigint "tenant_id"
    t.bigint "id", default: -> { "nextval('author_states_id_seq'::regclass)" }
    t.index ["authoring_id"], name: "author_states_9_authoring_id_idx"
    t.index ["id"], name: "author_states_9_id_idx"
    t.index ["state"], name: "author_states_9_state_idx"
    t.index ["tenant_id"], name: "author_states_9_tenant_id_idx"
  end

  create_table "author_states_migration", id: false, force: :cascade do |t|
    t.integer "authoring_id", null: false
    t.integer "state", null: false
    t.json "state_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bucket_name", limit: 255
    t.string "s3_url", limit: 255
    t.integer "thumbnail_id"
    t.integer "state_history", array: true
    t.integer "id", default: -> { "nextval('author_states_id_seq'::regclass)" }, null: false
  end

  create_table "authoring_assets", force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.bigint "video_template_id"
    t.bigint "asset_created_by"
    t.bigint "asset_folder_id"
    t.integer "asset_state"
    t.index ["asset_created_by"], name: "index_authoring_assets_on_asset_created_by"
    t.index ["asset_folder_id"], name: "index_authoring_assets_on_asset_folder_id"
    t.index ["asset_state"], name: "index_authoring_assets_on_asset_state"
  end

  create_table "authoring_assets_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_1_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_1_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_1_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_1_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_1_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_1_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_1_tenant_id_idx"
  end

  create_table "authoring_assets_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_10_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_10_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_10_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_10_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_10_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_10_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_10_tenant_id_idx"
  end

  create_table "authoring_assets_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_11_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_11_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_11_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_11_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_11_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_11_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_11_tenant_id_idx"
  end

  create_table "authoring_assets_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_12_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_12_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_12_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_12_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_12_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_12_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_12_tenant_id_idx"
  end

  create_table "authoring_assets_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_13_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_13_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_13_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_13_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_13_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_13_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_13_tenant_id_idx"
  end

  create_table "authoring_assets_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_14_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_14_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_14_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_14_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_14_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_14_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_14_tenant_id_idx"
  end

  create_table "authoring_assets_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_15_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_15_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_15_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_15_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_15_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_15_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_15_tenant_id_idx"
  end

  create_table "authoring_assets_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_16_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_16_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_16_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_16_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_16_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_16_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_16_tenant_id_idx"
  end

  create_table "authoring_assets_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_17_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_17_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_17_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_17_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_17_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_17_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_17_tenant_id_idx"
  end

  create_table "authoring_assets_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_18_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_18_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_18_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_18_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_18_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_18_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_18_tenant_id_idx"
  end

  create_table "authoring_assets_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_19_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_19_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_19_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_19_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_19_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_19_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_19_tenant_id_idx"
  end

  create_table "authoring_assets_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_2_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_2_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_2_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_2_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_2_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_2_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_2_tenant_id_idx"
  end

  create_table "authoring_assets_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_20_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_20_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_20_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_20_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_20_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_20_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_20_tenant_id_idx"
  end

  create_table "authoring_assets_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_3_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_3_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_3_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_3_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_3_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_3_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_3_tenant_id_idx"
  end

  create_table "authoring_assets_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_4_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_4_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_4_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_4_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_4_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_4_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_4_tenant_id_idx"
  end

  create_table "authoring_assets_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_5_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_5_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_5_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_5_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_5_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_5_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_5_tenant_id_idx"
  end

  create_table "authoring_assets_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_6_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_6_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_6_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_6_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_6_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_6_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_6_tenant_id_idx"
  end

  create_table "authoring_assets_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_7_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_7_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_7_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_7_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_7_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_7_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_7_tenant_id_idx"
  end

  create_table "authoring_assets_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_8_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_8_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_8_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_8_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_8_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_8_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_8_tenant_id_idx"
  end

  create_table "authoring_assets_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authoring_assets_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "authoring_assets_9_authoring_id_idx"
    t.index ["id"], name: "authoring_assets_9_id_idx"
    t.index ["intro_media_id"], name: "authoring_assets_9_intro_media_id_idx"
    t.index ["is_deleted"], name: "authoring_assets_9_is_deleted_idx"
    t.index ["media_id"], name: "authoring_assets_9_media_id_idx"
    t.index ["outro_media_id"], name: "authoring_assets_9_outro_media_id_idx"
    t.index ["tenant_id"], name: "authoring_assets_9_tenant_id_idx"
  end

  create_table "authoring_assets_dummy", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size"
    t.integer "media_id"
    t.json "content"
    t.integer "tags", array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried"
    t.integer "exported_time_exceeded"
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled"
    t.integer "groups", array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled"
    t.boolean "is_deleted"
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized"
    t.bigint "guest_user_id"
    t.integer "major_state"
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
  end

  create_table "authoring_assets_migration", id: :bigint, default: -> { "nextval('authoring_assets_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "authoring_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_size", default: 0
    t.integer "media_id"
    t.json "content"
    t.integer "tags", default: [], array: true
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "last_stat_id_queried", default: 0
    t.integer "exported_time_exceeded", default: 0
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
    t.integer "is_comments_enabled", default: 1
    t.integer "groups", default: [], array: true
    t.datetime "record_end_time"
    t.integer "is_reactions_enabled", default: 1
    t.boolean "is_deleted", default: false
    t.json "video_settings"
    t.text "preview_key"
    t.boolean "is_personalized", default: false
    t.bigint "guest_user_id"
    t.integer "major_state", default: 0
    t.bigint "selected_page_id"
    t.integer "intro_media_id"
    t.integer "outro_media_id"
    t.index ["authoring_id"], name: "index_authoring_assets_on_authoring_id"
    t.index ["intro_media_id"], name: "index_authoring_assets_on_intro_media_id"
    t.index ["is_deleted"], name: "index_authoring_assets_on_is_deleted"
    t.index ["media_id"], name: "index_authoring_assets_on_media_id"
    t.index ["outro_media_id"], name: "index_authoring_assets_on_outro_media_id"
    t.index ["tenant_id"], name: "index_authoring_assets_on_tenant_id"
  end

  create_table "authoring_thumbnails", force: :cascade do |t|
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorings", force: :cascade do |t|
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
  end

  create_table "authorings_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_1_created_by_idx"
    t.index ["folder_id"], name: "authorings_1_folder_id_idx"
    t.index ["id"], name: "authorings_1_id_idx"
    t.index ["tenant_id"], name: "authorings_1_tenant_id_idx"
  end

  create_table "authorings_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_10_created_by_idx"
    t.index ["folder_id"], name: "authorings_10_folder_id_idx"
    t.index ["id"], name: "authorings_10_id_idx"
    t.index ["tenant_id"], name: "authorings_10_tenant_id_idx"
  end

  create_table "authorings_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_11_created_by_idx"
    t.index ["folder_id"], name: "authorings_11_folder_id_idx"
    t.index ["id"], name: "authorings_11_id_idx"
    t.index ["tenant_id"], name: "authorings_11_tenant_id_idx"
  end

  create_table "authorings_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_12_created_by_idx"
    t.index ["folder_id"], name: "authorings_12_folder_id_idx"
    t.index ["id"], name: "authorings_12_id_idx"
    t.index ["tenant_id"], name: "authorings_12_tenant_id_idx"
  end

  create_table "authorings_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_13_created_by_idx"
    t.index ["folder_id"], name: "authorings_13_folder_id_idx"
    t.index ["id"], name: "authorings_13_id_idx"
    t.index ["tenant_id"], name: "authorings_13_tenant_id_idx"
  end

  create_table "authorings_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_14_created_by_idx"
    t.index ["folder_id"], name: "authorings_14_folder_id_idx"
    t.index ["id"], name: "authorings_14_id_idx"
    t.index ["tenant_id"], name: "authorings_14_tenant_id_idx"
  end

  create_table "authorings_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_15_created_by_idx"
    t.index ["folder_id"], name: "authorings_15_folder_id_idx"
    t.index ["id"], name: "authorings_15_id_idx"
    t.index ["tenant_id"], name: "authorings_15_tenant_id_idx"
  end

  create_table "authorings_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_16_created_by_idx"
    t.index ["folder_id"], name: "authorings_16_folder_id_idx"
    t.index ["id"], name: "authorings_16_id_idx"
    t.index ["tenant_id"], name: "authorings_16_tenant_id_idx"
  end

  create_table "authorings_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_17_created_by_idx"
    t.index ["folder_id"], name: "authorings_17_folder_id_idx"
    t.index ["id"], name: "authorings_17_id_idx"
    t.index ["tenant_id"], name: "authorings_17_tenant_id_idx"
  end

  create_table "authorings_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_18_created_by_idx"
    t.index ["folder_id"], name: "authorings_18_folder_id_idx"
    t.index ["id"], name: "authorings_18_id_idx"
    t.index ["tenant_id"], name: "authorings_18_tenant_id_idx"
  end

  create_table "authorings_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_19_created_by_idx"
    t.index ["folder_id"], name: "authorings_19_folder_id_idx"
    t.index ["id"], name: "authorings_19_id_idx"
    t.index ["tenant_id"], name: "authorings_19_tenant_id_idx"
  end

  create_table "authorings_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_2_created_by_idx"
    t.index ["folder_id"], name: "authorings_2_folder_id_idx"
    t.index ["id"], name: "authorings_2_id_idx"
    t.index ["tenant_id"], name: "authorings_2_tenant_id_idx"
  end

  create_table "authorings_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_20_created_by_idx"
    t.index ["folder_id"], name: "authorings_20_folder_id_idx"
    t.index ["id"], name: "authorings_20_id_idx"
    t.index ["tenant_id"], name: "authorings_20_tenant_id_idx"
  end

  create_table "authorings_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_3_created_by_idx"
    t.index ["folder_id"], name: "authorings_3_folder_id_idx"
    t.index ["id"], name: "authorings_3_id_idx"
    t.index ["tenant_id"], name: "authorings_3_tenant_id_idx"
  end

  create_table "authorings_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_4_created_by_idx"
    t.index ["folder_id"], name: "authorings_4_folder_id_idx"
    t.index ["id"], name: "authorings_4_id_idx"
    t.index ["tenant_id"], name: "authorings_4_tenant_id_idx"
  end

  create_table "authorings_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_5_created_by_idx"
    t.index ["folder_id"], name: "authorings_5_folder_id_idx"
    t.index ["id"], name: "authorings_5_id_idx"
    t.index ["tenant_id"], name: "authorings_5_tenant_id_idx"
  end

  create_table "authorings_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_6_created_by_idx"
    t.index ["folder_id"], name: "authorings_6_folder_id_idx"
    t.index ["id"], name: "authorings_6_id_idx"
    t.index ["tenant_id"], name: "authorings_6_tenant_id_idx"
  end

  create_table "authorings_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_7_created_by_idx"
    t.index ["folder_id"], name: "authorings_7_folder_id_idx"
    t.index ["id"], name: "authorings_7_id_idx"
    t.index ["tenant_id"], name: "authorings_7_tenant_id_idx"
  end

  create_table "authorings_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_8_created_by_idx"
    t.index ["folder_id"], name: "authorings_8_folder_id_idx"
    t.index ["id"], name: "authorings_8_id_idx"
    t.index ["tenant_id"], name: "authorings_8_tenant_id_idx"
  end

  create_table "authorings_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('authorings_id_seq'::regclass)" }
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "authorings_9_created_by_idx"
    t.index ["folder_id"], name: "authorings_9_folder_id_idx"
    t.index ["id"], name: "authorings_9_id_idx"
    t.index ["tenant_id"], name: "authorings_9_tenant_id_idx"
  end

  create_table "authorings_migration", id: :bigint, default: -> { "nextval('authorings_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_state", default: 0
    t.string "title", limit: 255
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "folder_id", default: 1
    t.json "record_configuration"
    t.text "browser_info"
    t.json "upload_rate"
    t.json "browser_info_json"
    t.index ["created_by"], name: "index_authorings_on_created_by"
    t.index ["folder_id"], name: "index_authorings_on_folder_id"
  end

  create_table "bils", force: :cascade do |t|
    t.bigint "amount"
    t.string "type"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boolean_components", primary_key: ["quiz_component_id", "option_id"], force: :cascade do |t|
    t.bigint "quiz_component_id", null: false
    t.string "option_label", limit: 255
    t.integer "option_order"
    t.boolean "correct_answer"
    t.integer "option_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "image_id"
  end

  create_table "branching_video_stats", force: :cascade do |t|
    t.jsonb "data", default: "{}"
    t.bigint "stats_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "uuid", limit: 255
    t.index ["stats_id"], name: "index_branching_video_stats_on_stats_id"
    t.index ["uuid"], name: "index_branching_video_stats_on_uuid"
  end

  create_table "bucket_feature_mappings", force: :cascade do |t|
    t.integer "referral_buckets_id"
    t.integer "referral_features_id"
  end

  create_table "call_to_actions", primary_key: "cta_components_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "action_type"
    t.text "cta_text"
    t.integer "image_id"
    t.text "html_content"
    t.text "cta_link"
    t.json "properties", default: {}
    t.boolean "skip_allowed", default: true
    t.string "s3_html_content_path", limit: 255
    t.datetime "updated_at"
  end

  create_table "campaign_and_mails", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "mail_id"
    t.string "to", limit: 255
    t.datetime "created_at"
    t.json "contact_data"
    t.json "additional_info"
    t.boolean "is_test_mail", default: false
    t.string "message_id", limit: 255
    t.string "thread_id", limit: 255
    t.datetime "updated_at"
    t.index ["campaign_id"], name: "index_campaign_and_mails_on_campaign_id"
    t.index ["mail_id"], name: "index_campaign_and_mails_on_mail_id"
    t.index ["thread_id"], name: "index_campaign_and_mails_on_thread_id"
  end

  create_table "campaign_mail_contents", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.text "content"
    t.string "referer", limit: 255
  end

  create_table "cancellation_feedbacks", force: :cascade do |t|
    t.integer "tenant_id"
    t.datetime "cb_cancellation_timestamp"
    t.json "feedback"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "tenant_id"
    t.integer "product_id", default: 1
    t.integer "times_used"
    t.integer "created_by"
    t.boolean "system_tag", default: false
    t.index "to_tsvector('english'::regconfig, (COALESCE(category, ''::character varying))::text)", name: "category_search_idx", using: :gin
  end

  create_table "certificate_templates", force: :cascade do |t|
    t.string "name", limit: 255
    t.json "param_json"
    t.string "bg_image", limit: 255
    t.integer "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapter_resources", primary_key: ["id", "course_chapter_id"], force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", limit: 255
    t.text "description"
    t.text "content"
    t.string "resource_url", limit: 255
    t.integer "module_attachment"
    t.integer "module_order"
    t.boolean "mandatory"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "assessment_id"
    t.integer "tags", default: [], array: true
    t.integer "resource_type"
    t.integer "course_chapter_id", null: false
    t.boolean "from_library", default: false
  end

  create_table "checkbox_components", primary_key: ["quiz_component_id", "option_id"], force: :cascade do |t|
    t.bigint "quiz_component_id", null: false
    t.string "option_label", limit: 255
    t.integer "option_order"
    t.boolean "correct_answer"
    t.integer "option_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "image_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.integer "created_by"
    t.integer "is_active"
    t.json "criteria"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deactivated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string "country", limit: 255
    t.string "city", limit: 255
    t.string "accent_city", limit: 255
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["country", "city"], name: "index_cities_on_country_and_city"
  end

  create_table "client_services", force: :cascade do |t|
    t.string "service_name", limit: 255
    t.string "client_id", limit: 255
    t.string "client_secret", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "app_type"
    t.index ["client_id", "client_secret"], name: "index_client_services_on_client_id_and_client_secret"
    t.index ["client_id"], name: "index_client_services_on_client_id"
    t.index ["service_name"], name: "index_client_services_on_service_name"
  end

  create_table "client_tokens", force: :cascade do |t|
    t.integer "token_type"
    t.string "token", limit: 255
    t.integer "user_id"
    t.integer "tenant_id"
    t.integer "whitelist_domain_ids", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id"], name: "index_client_tokens_on_tenant_id"
    t.index ["token"], name: "index_client_tokens_on_token"
    t.index ["token_type"], name: "index_client_tokens_on_token_type"
    t.index ["user_id"], name: "index_client_tokens_on_user_id"
  end

  create_table "component_choices", primary_key: ["quiz_component_id", "option_id"], force: :cascade do |t|
    t.bigint "quiz_component_id", null: false
    t.string "option_label", limit: 255
    t.integer "option_order"
    t.boolean "correct_answer"
    t.bigint "option_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "image_id"
    t.index ["quiz_component_id", "option_id"], name: "index_component_choices_on_quiz_component_id_and_option_id", unique: true
  end

  create_table "component_images", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "user_id"
    t.json "file_exist"
  end

  create_table "configurations", force: :cascade do |t|
    t.string "environment", limit: 255
    t.string "configuration_type", limit: 255
    t.jsonb "configuration"
    t.index ["configuration_type", "environment"], name: "index_configurations_on_configuration_type_and_environment"
  end

  create_table "connected_apps", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tenant_id"
    t.integer "user_id"
    t.integer "client_app_id"
    t.string "api_token", limit: 255
    t.index ["api_token"], name: "index_connected_apps_on_api_token"
    t.index ["user_id", "api_token"], name: "index_connected_apps_on_user_id_and_api_token"
    t.index ["user_id", "client_app_id"], name: "index_connected_apps_on_user_id_and_client_app_id"
  end

  create_table "contact_activities", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "context_id"
    t.integer "activity_id"
    t.integer "asset_id"
    t.integer "activity_reference_id"
    t.datetime "created_at"
    t.bigint "visitor_id"
    t.integer "referer_contact_id"
    t.index ["activity_id"], name: "index_contact_activities_on_activity_id"
    t.index ["contact_id", "context_id"], name: "index_contact_activities_on_contact_id_and_context_id"
    t.index ["visitor_id"], name: "index_contact_activities_on_visitor_id"
  end

  create_table "contact_assets", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "asset_id"
    t.integer "lead_status"
    t.integer "assigned_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "esa_id"
    t.index ["asset_id"], name: "index_contact_assets_on_asset_id"
    t.index ["contact_id"], name: "index_contact_assets_on_contact_id"
  end

  create_table "contact_mapping_temp_table", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "tenant_id"
    t.bigint "stats_id"
    t.bigint "contact_id"
    t.integer "context_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 255
    t.text "notes"
    t.integer "lists", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "create_from"
    t.integer "created_by"
    t.string "company_name", limit: 255
    t.integer "create_from_context"
    t.string "city", limit: 255
    t.string "country", limit: 255
    t.integer "contexts", default: [], array: true
    t.jsonb "custom_fields", default: {}
    t.integer "owner"
    t.index "to_tsvector('english'::regconfig, (((((((((COALESCE(first_name, ''::character varying))::text || ' '::text) || (COALESCE(email, ''::character varying))::text) || ' '::text) || (COALESCE(last_name, ''::character varying))::text) || ' '::text) || (COALESCE(company_name, ''::character varying))::text) || ' '::text) || COALESCE(notes, ''::text)))", name: "contacts_word_idx", using: :gin
    t.index ["contexts"], name: "contacts_contexts_idx", using: :gin
    t.index ["created_by"], name: "contacts_created_by_idx"
    t.index ["tenant_id", "email"], name: "index_contacts_on_tenant_id_and_email", unique: true
    t.index ["tenant_id"], name: "index_contacts_on_tenant_id"
  end

  create_table "cookie_consent_trackers", force: :cascade do |t|
    t.bigint "tenant_id"
    t.text "tracking_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id"], name: "index_cookie_consent_trackers_on_tenant_id"
  end

  create_table "core_actions_trackers", force: :cascade do |t|
    t.bigint "tenant_id"
    t.integer "license_type"
    t.integer "org_user_id"
    t.integer "action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_continent", force: :cascade do |t|
    t.text "country"
    t.string "code_2", limit: 255
    t.string "code_3", limit: 255
    t.string "country_code", limit: 255
    t.string "continent", limit: 255
    t.string "continent_code", limit: 255
  end

  create_table "coupon_codes", force: :cascade do |t|
    t.string "coupon_code", limit: 255
    t.float "discount_percentage"
    t.integer "group_names", default: [], array: true
    t.string "period", limit: 255, default: [], array: true
  end

  create_table "course_assign_settings", primary_key: "course_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "assign_type"
    t.integer "login_required", limit: 2
    t.integer "email_template_id"
    t.boolean "ask_name"
    t.boolean "ask_email"
    t.boolean "ask_phone"
    t.boolean "name_mandatory"
    t.boolean "email_mandatory"
    t.boolean "phone_mandatory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_attendee_data", force: :cascade do |t|
    t.integer "course_session_detail_id"
    t.integer "chapter_resource_id"
    t.float "score"
    t.integer "resource_type"
    t.text "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status", default: 0
  end

  create_table "course_availability_settings", primary_key: "course_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "enabled", default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "num_allowed_attempts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_chapters", primary_key: ["id", "course_id"], force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "title", limit: 255
    t.text "description"
    t.integer "num_modules"
    t.integer "instructor_id"
    t.boolean "mandatory"
    t.integer "chapter_logo_id"
    t.integer "chapter_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "course_id", null: false
  end

  create_table "course_contacts", force: :cascade do |t|
    t.integer "course_assign_setting_id"
    t.string "email_id", limit: 255
    t.string "password", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "phone", limit: 255
    t.integer "num_attempts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_assign_setting_id", "email_id"], name: "index_course_contacts_on_course_assign_setting_id_and_email_id", unique: true
  end

  create_table "course_footers", primary_key: "courses_id", id: :bigint, default: nil, force: :cascade do |t|
    t.text "footer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_introductions", primary_key: "courses_id", id: :bigint, default: nil, force: :cascade do |t|
    t.text "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_notification_settings", primary_key: "course_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "update_admin"
    t.integer "admin_report_type"
    t.integer "admin_template_id"
    t.boolean "update_test_taker"
    t.integer "test_taker_report_type"
    t.integer "test_taker_template_id"
    t.boolean "update_others"
    t.integer "others_report_type"
    t.integer "others_template_id"
    t.string "other_emails", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_result_settings", primary_key: "course_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "show_certificate", default: false
    t.boolean "certificate_type"
    t.integer "certificate_template_id"
    t.boolean "show_custom_msg"
    t.text "custom_msg"
    t.integer "show_assessment_grades"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_session_details", force: :cascade do |t|
    t.integer "course_id"
    t.integer "attendee_type"
    t.integer "attendee_id"
    t.string "result", limit: 255
    t.integer "status"
    t.float "score"
    t.string "attendee_ip", limit: 255
    t.integer "validation_status"
    t.integer "total_modules"
    t.integer "completed_modules_count"
    t.text "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "session_state"
    t.index ["course_id"], name: "index_course_session_details_on_course_id"
  end

  create_table "course_settings", primary_key: "course_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "course_order_type", default: 1
    t.integer "mandatory_chapters", array: true
    t.string "ref_code", limit: 255
    t.boolean "self_enroll"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_taking_settings", primary_key: "course_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "save_resume", default: false
    t.boolean "sidebar_on_test", default: true
    t.boolean "show_exit", default: false
    t.float "min_score_to_proceed"
    t.integer "min_time_to_proceed"
    t.integer "min_time_to_complete"
    t.boolean "skip_allowed", default: false
    t.integer "download", default: 1
    t.integer "downloadable_chapters", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_test_details", primary_key: ["course_session_detail_id", "test_details_id"], force: :cascade do |t|
    t.integer "course_session_detail_id", null: false
    t.integer "test_details_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_versions", primary_key: ["course_id", "course_root_id"], force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "course_root_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "title", limit: 255
    t.text "description"
    t.string "author", limit: 255
    t.string "author_desig", limit: 255
    t.integer "categories", default: [], array: true
    t.integer "active", limit: 2
    t.integer "rating"
    t.string "join_code", limit: 255
    t.integer "delivery_type"
    t.string "language", limit: 255
    t.integer "skills", default: [], array: true
    t.integer "likes"
    t.integer "dislikes"
    t.integer "course_level"
    t.integer "course_logo_id"
    t.integer "course_mode", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_published_time"
  end

  create_table "credits_usage_stats", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "media_id"
    t.integer "operation_type"
    t.float "usage_stats"
    t.datetime "created_at"
  end

  create_table "cta_components", force: :cascade do |t|
    t.bigint "authoring_assets_id"
    t.integer "cta_type", limit: 2
    t.boolean "enabled", default: true
    t.bigint "created_by"
    t.integer "time_to_show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_last_second"
    t.index ["authoring_assets_id"], name: "index_cta_components_on_authoring_assets_id"
  end

  create_table "cta_forms", primary_key: "cta_components_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "upper_text"
    t.text "lower_text"
    t.boolean "skip_allowed"
    t.boolean "ask_phone"
    t.json "service_params"
    t.string "service_uid", limit: 255
    t.string "submit_text", limit: 255
    t.boolean "ask_company"
    t.datetime "updated_at"
    t.string "button_color", limit: 255, default: "#4ea7bc"
  end

  create_table "cta_question_stats", id: :serial, force: :cascade do |t|
    t.integer "video_delivery_stats_id", null: false
    t.integer "cta_questions_id", null: false
    t.string "selected_option", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "question_skipped", default: false
    t.bigint "tenant_id"
    t.index ["cta_questions_id"], name: "index_cta_question_stats_on_cta_questions_id"
    t.index ["id"], name: "index_cta_question_stats_on_id"
    t.index ["tenant_id"], name: "index_cta_question_stats_on_tenant_id"
    t.index ["video_delivery_stats_id", "cta_questions_id"], name: "index_cta_question_stats_on_stats_id"
  end

  create_table "cta_questions", force: :cascade do |t|
    t.integer "cta_components_id"
    t.integer "question_type", default: 1
    t.text "question"
    t.string "options", limit: 255, default: [], array: true
    t.boolean "skip_allowed"
    t.string "submit_text", limit: 255
    t.datetime "updated_at"
    t.index ["cta_components_id"], name: "index_cta_questions_on_cta_components_id"
  end

  create_table "cta_stats", force: :cascade do |t|
    t.integer "video_delivery_stats_id"
    t.json "annotation_status"
    t.json "annotation_click_time"
    t.boolean "call_to_action_status"
    t.boolean "call_to_action_skipped"
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.boolean "form_skipped"
    t.boolean "end_screen_status"
    t.integer "end_screen_click_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "embed_form_skipped", default: false
    t.boolean "embed_form_status", default: false
    t.boolean "end_card_status", default: false
    t.bigint "visitor_id"
    t.string "company_name", limit: 255
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_cta_stats_on_tenant_id"
    t.index ["video_delivery_stats_id"], name: "index_cta_stats_on_video_delivery_stats_id"
    t.index ["visitor_id"], name: "index_cta_stats_on_visitor_id"
  end

  create_table "custom_field_list_values", force: :cascade do |t|
    t.bigint "custom_field_id"
    t.string "field_value", limit: 255
    t.bigint "parent_field_id"
    t.index ["custom_field_id"], name: "index_custom_field_list_values_on_custom_field_id"
    t.index ["parent_field_id"], name: "index_custom_field_list_values_on_parent_field_id"
  end

  create_table "custom_fonts", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "font_family", limit: 255
    t.boolean "is_default"
    t.boolean "is_supported_in_thumbnail"
    t.boolean "is_bold"
    t.boolean "is_italic"
    t.boolean "is_bold_italic"
    t.string "font_format", limit: 255
    t.string "s3_path", limit: 255
    t.string "show_condition", limit: 255
  end

  create_table "custom_questions", force: :cascade do |t|
    t.text "question"
    t.integer "question_options"
    t.integer "question_for"
    t.integer "order"
    t.boolean "is_mandatory"
    t.integer "portal_settings_id"
    t.boolean "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "possible_answers", default: [], array: true
    t.bigint "quiz_assign_setting_id"
  end

  create_table "custom_thumbnails", force: :cascade do |t|
    t.integer "asset_id"
    t.json "thumbnails"
    t.integer "current_thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "personalize_json"
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_custom_thumbnails_on_tenant_id"
  end

  create_table "default_email_templates", force: :cascade do |t|
    t.integer "email_template_type_id"
    t.string "name", limit: 255
    t.string "subject", limit: 255
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "module", default: 1
    t.integer "priority", default: -1
  end

  create_table "default_rbac_profiles", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.json "criteria"
    t.integer "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_teleprompter_scripts", force: :cascade do |t|
    t.string "script_title", limit: 255
    t.text "script_description"
    t.boolean "is_first_script"
    t.integer "script_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "onboarding_status"
  end

  create_table "default_video_template_cards", force: :cascade do |t|
    t.integer "default_video_template_id"
    t.bigint "slide_id"
    t.string "title", limit: 255
    t.string "sub_title", limit: 255
    t.integer "option", default: 2
    t.string "option_list", limit: 255, array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_video_templates", force: :cascade do |t|
    t.string "template_name", limit: 255
    t.integer "onboarding_status"
    t.boolean "visibility"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "template_order", default: -1
    t.integer "visible_always", default: 0
    t.string "template_thumbnail", limit: 255, default: "/img/videosandwich-thumbnail.jpg"
    t.text "categories", default: [], array: true
    t.string "custom_component_name", limit: 255
    t.text "preview_title"
    t.text "preview_description"
    t.string "template_gif_thumbnail"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by", limit: 255
    t.string "queue", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "delayed_reference_id"
    t.string "delayed_reference_type", limit: 255
    t.index ["delayed_reference_id"], name: "delayed_jobs_delayed_reference_id"
    t.index ["delayed_reference_type"], name: "delayed_jobs_delayed_reference_type"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
    t.index ["queue"], name: "delayed_jobs_queue"
  end

  create_table "delivery_download_stats", force: :cascade do |t|
    t.integer "stat_id"
    t.integer "count", default: 0
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "uuid", limit: 255
    t.index ["asset_id"], name: "index_delivery_download_stats_on_asset_id"
    t.index ["stat_id"], name: "index_delivery_download_stats_on_stat_id"
    t.index ["uuid"], name: "index_delivery_download_stats_on_uuid"
  end

  create_table "delivery_email_forms", force: :cascade do |t|
    t.integer "org_user_id"
    t.integer "tenant_id"
    t.boolean "require_email"
    t.string "heading_text", limit: 255
    t.text "sub_heading_text"
    t.string "button_text", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["org_user_id", "tenant_id"], name: "index_delivery_email_forms_on_org_user_id_and_tenant_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "dept_name"
  end

  create_table "discard_domains", force: :cascade do |t|
    t.string "domain_name", limit: 255
    t.boolean "is_mail_provider"
    t.boolean "notified"
    t.datetime "mail_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "score_added", default: false
    t.boolean "non_business", default: false
    t.bigint "existing_lead_owner_id"
  end

  create_table "domain_vs_informations", force: :cascade do |t|
    t.string "logo_bucket", limit: 255
    t.string "logo_key", limit: 255
    t.json "bg_colors"
    t.string "domain_name", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drive_app_files", primary_key: ["export_user_id", "file_id"], force: :cascade do |t|
    t.bigint "export_user_id", null: false
    t.string "file_id", limit: 255, null: false
    t.bigint "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state"
    t.json "file_info"
    t.index ["asset_id"], name: "drive_app_files_asset_id_idx"
  end

  create_table "dynamic_integ_urls", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "org_user_id"
    t.string "integ_name", limit: 255
    t.string "host_url", limit: 255
    t.string "href_url", limit: 255
  end

  create_table "dynamic_integration_configs", force: :cascade do |t|
    t.integer "org_user_id"
    t.json "config"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dynamic_integrations", force: :cascade do |t|
    t.string "integ_name", limit: 255
    t.string "display_name", limit: 255
    t.integer "integ_type"
    t.boolean "is_default", default: false
    t.integer "group_names", default: [], array: true
    t.datetime "updated_at"
  end

  create_table "email_replies", force: :cascade do |t|
    t.integer "mail_id"
    t.integer "campaign_id"
    t.integer "contact_id"
    t.string "from", limit: 255
    t.string "to", limit: 255
    t.string "message_id", limit: 255
    t.string "reference_id", limit: 255
    t.text "reply_content"
    t.datetime "reply_time"
    t.text "additional_data"
    t.index ["mail_id", "message_id"], name: "index_email_replies_on_mail_id_and_message_id", unique: true
    t.index ["mail_id"], name: "index_email_replies_on_mail_id"
    t.index ["reference_id"], name: "index_email_replies_on_reference_id"
  end

  create_table "email_template_categories", force: :cascade do |t|
    t.string "category", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_template_types", force: :cascade do |t|
    t.integer "email_template_category_id"
    t.string "template_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "embed_crm_forms", id: :serial, force: :cascade do |t|
    t.integer "cta_components_id"
    t.text "embed_form"
    t.integer "end_time"
    t.boolean "allow_play", default: false
    t.string "s3_html_content_path", limit: 255
    t.datetime "updated_at"
    t.json "properties", default: {}
    t.boolean "skip_allowed", default: true
    t.index ["cta_components_id"], name: "index_embed_crm_forms_on_cta_components_id"
  end

  create_table "embed_seos", force: :cascade do |t|
    t.integer "asset_id"
    t.string "file_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "designation"
    t.integer "dept_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_screens", primary_key: "cta_components_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "asset_id"
    t.integer "last_num_seconds"
    t.datetime "updated_at"
  end

  create_table "entities", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.bigint "user_id"
    t.integer "user_type"
    t.integer "entity_type"
    t.integer "video_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tenant_id"
    t.boolean "is_from_preview"
    t.integer "esa_id"
    t.index ["asset_id"], name: "index_entities_on_asset_id"
    t.index ["entity_type"], name: "index_entities_on_entity_type"
    t.index ["esa_id"], name: "index_entities_on_esa_id"
    t.index ["tenant_id"], name: "index_entities_on_tenant_id"
    t.index ["user_type", "user_id"], name: "index_entities_on_user_type_and_user_id"
    t.index ["video_time"], name: "index_entities_on_video_time"
  end

  create_table "entity_comment", primary_key: "entity_id", id: :bigint, default: nil, force: :cascade do |t|
    t.text "comment", null: false
    t.string "video_cmt_embed_url", limit: 255
    t.boolean "hide_comment", default: false
    t.datetime "updated_at"
  end

  create_table "entity_reaction", primary_key: "entity_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "reaction_type", null: false
  end

  create_table "entity_reply", primary_key: "entity_id", id: :bigint, default: nil, force: :cascade do |t|
    t.text "reply", null: false
    t.string "video_cmt_embed_url", limit: 255
    t.bigint "comment_id", null: false
    t.boolean "hide_reply", default: false
    t.datetime "updated_at"
  end

  create_table "error_logs", force: :cascade do |t|
    t.integer "authoring_asset_id"
    t.string "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "stack_trace"
    t.integer "user_id"
    t.index ["authoring_asset_id"], name: "error_logs_asset_id_idx"
    t.index ["user_id"], name: "index_error_logs_on_user_id"
  end

  create_table "essays", primary_key: "quiz_component_id", id: :bigint, default: nil, force: :cascade do |t|
    t.text "answer"
    t.integer "num_lines"
    t.integer "max_chars"
    t.integer "char_each_line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export_share_stats", force: :cascade do |t|
    t.bigint "asset_id"
    t.integer "export_count", default: 0
    t.integer "download_count", default: 0
    t.integer "play_count", default: 0
    t.integer "share_count", default: 0
    t.json "stats_params", default: {}
    t.integer "view_count", default: 0
    t.date "entry_date"
    t.integer "entry_hour"
    t.datetime "updated_at"
    t.index ["asset_id"], name: "export_share_stats_asset_id_idx"
  end

  create_table "export_tokens", force: :cascade do |t|
    t.integer "org_user_id"
    t.string "email", limit: 255
    t.text "account_name"
    t.text "token"
    t.string "provider", limit: 255
    t.text "unique_id"
    t.string "custom_value", limit: 255
    t.text "scopes", default: [], array: true
    t.json "smtp_conf"
    t.string "smtp_user_name", limit: 255
  end

  create_table "exported_video_links", force: :cascade do |t|
    t.integer "org_user_id"
    t.integer "media_id"
    t.string "youtube", limit: 255
    t.string "gdrive", limit: 255
    t.string "exported_link", limit: 255
    t.integer "export_type"
    t.string "privacy_option", limit: 255
  end

  create_table "external_client_form_informations", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "client_name", limit: 255
    t.json "form_data", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "asset_id"
    t.index ["tenant_id"], name: "index_external_client_form_informations_on_tenant_id"
  end

  create_table "external_mail_clients", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "provider_id"
    t.string "format", limit: 255
    t.json "field_names"
    t.boolean "show_embed_code"
    t.boolean "show_links"
  end

  create_table "external_service_assets", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "service_type"
    t.integer "external_service_id"
    t.integer "tenant_id"
    t.integer "attached_by"
    t.integer "status"
    t.json "personalized_video"
    t.string "uuid", limit: 255
    t.integer "open_count"
    t.datetime "open_time"
    t.datetime "created_at"
    t.datetime "mail_sent_time"
    t.datetime "expiry_time"
    t.boolean "is_deleted", default: false
    t.jsonb "merge_field_data", default: {}
    t.boolean "is_rendered", default: false
    t.bigint "primary_asset_id"
    t.json "cta_merge_fields"
    t.boolean "is_test_mail", default: false
    t.boolean "require_email", default: false
    t.datetime "updated_at"
    t.boolean "is_viewed"
    t.integer "reply_count"
    t.bigint "hv_context_id"
    t.index ["asset_id"], name: "index_external_service_assets_on_asset_id"
    t.index ["attached_by"], name: "index_external_service_assets_on_attached_by"
    t.index ["expiry_time"], name: "index_external_service_assets_on_expiry_time"
    t.index ["external_service_id"], name: "index_external_service_assets_on_external_service_id"
    t.index ["hv_context_id"], name: "index_external_service_assets_on_hv_context_id"
    t.index ["merge_field_data"], name: "esa_merge_field_data_idx", using: :gin
    t.index ["primary_asset_id"], name: "index_external_service_assets_on_primary_asset_id"
    t.index ["service_type"], name: "index_external_service_assets_on_service_type"
    t.index ["tenant_id"], name: "index_external_service_assets_on_tenant_id"
    t.index ["uuid"], name: "index_external_service_assets_on_uuid"
  end

  create_table "failed_integrations", force: :cascade do |t|
    t.string "domain", limit: 255
    t.string "email", limit: 255
    t.integer "integ_type"
    t.boolean "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["domain"], name: "index_failed_integrations_on_domain", unique: true
  end

  create_table "feature_groups", force: :cascade do |t|
    t.string "group_name", limit: 255
  end

  create_table "form_components", primary_key: ["form_id", "fieldname"], force: :cascade do |t|
    t.bigint "component_id", default: -> { "nextval('form_component_component_id_seq'::regclass)" }
    t.bigint "form_id", null: false
    t.string "label", limit: 255
    t.string "fieldtype", limit: 255
    t.string "placeholder", limit: 255
    t.string "inputsize", limit: 255
    t.text "helptext"
    t.boolean "required"
    t.string "fieldname", limit: 255, null: false
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_meta", primary_key: "form_id", force: :cascade do |t|
    t.integer "tenant_id"
    t.bigint "org_id"
    t.string "form_name", limit: 255
    t.string "display_name", limit: 255
    t.string "description", limit: 255, default: "no description specified"
    t.string "table_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gdrive_syncs", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "media_id"
    t.string "file_id", limit: 255
    t.string "folder_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "global_cta", force: :cascade do |t|
    t.integer "cta_components_id"
    t.string "field_name", limit: 255
    t.text "cta_text"
    t.string "button_text", limit: 255
    t.string "button_link", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "display_data"
    t.index ["cta_components_id"], name: "index_global_cta_on_cta_components_id"
  end

  create_table "global_search_new", force: :cascade do |t|
    t.json "search_data"
  end

  create_table "global_searches", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "org_user_id"
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.integer "asset_data_id"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "thumbnail_bucket"
    t.text "thumbnail_key"
  end

  create_table "gmail_service_assets", force: :cascade do |t|
    t.string "thread_id", limit: 255
    t.string "msg_id", limit: 255
    t.string "legacy_thread_id", limit: 255
    t.string "legacy_msg_id", limit: 255
    t.index ["legacy_msg_id"], name: "index_gmail_service_assets_on_legacy_msg_id"
    t.index ["legacy_thread_id"], name: "index_gmail_service_assets_on_legacy_thread_id"
    t.index ["msg_id"], name: "index_gmail_service_assets_on_msg_id"
    t.index ["thread_id"], name: "index_gmail_service_assets_on_thread_id"
  end

  create_table "grade_range_settings", primary_key: ["quiz_score_setting_id", "grade_name"], force: :cascade do |t|
    t.integer "grade_order"
    t.integer "start_mark"
    t.integer "end_mark"
    t.string "grade_name", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "quiz_score_setting_id", null: false
  end

  create_table "greetings_theme_mappings", force: :cascade do |t|
    t.bigint "tenant_id"
    t.integer "theme_id"
    t.bigint "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_product"
  end

  create_table "greetings_themes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.json "intro_video"
    t.json "outro_video"
    t.json "sample_video"
    t.string "thumbnail_path"
    t.json "overlay_details"
    t.json "renderless_details"
    t.json "custom_thumbnail_json"
    t.json "logo_details"
    t.float "thumbnail_time"
    t.integer "audio_ids", array: true
    t.integer "theme_order", limit: 2
    t.boolean "is_sequoia", default: false
    t.string "template_type", limit: 100
  end

  create_table "group_entities", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "group_id"
    t.integer "entity_type"
    t.integer "entity_id"
    t.boolean "is_direct"
    t.integer "inherited_from"
    t.integer "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id", "group_id", "entity_type"], name: "index_group_entities_on_tenant_id_and_group_id_and_entity_type"
  end

  create_table "guest_details", force: :cascade do |t|
    t.integer "authoring_asset_id"
    t.integer "org_user_id"
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.json "custom_params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["authoring_asset_id"], name: "index_guest_details_on_authoring_asset_id"
  end

  create_table "guest_hippo_user_mappings", force: :cascade do |t|
    t.string "guest_email", limit: 255
    t.string "new_email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["new_email"], name: "index_guest_hippo_user_mappings_on_new_email"
  end

  create_table "guest_users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "index_guest_users_on_name"
  end

  create_table "hdfc_life_informations", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "asset_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "share_with_name", limit: 255
    t.string "share_with_mobile_no", limit: 255
    t.string "share_with_email", limit: 255
    t.string "email", limit: 255
    t.string "mobile_no", limit: 255
    t.string "education", limit: 255
    t.string "pin_code", limit: 255
    t.datetime "invited_at"
    t.datetime "joined_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "occupation", limit: 255
    t.string "city", limit: 255
    t.date "dob"
    t.string "agency_code", limit: 255
    t.string "branch_code", limit: 255
  end

  create_table "hippo_cs_boxes", force: :cascade do |t|
    t.string "feature_id", limit: 255
    t.string "module_id", limit: 255
    t.string "activity_path", limit: 255, default: [], array: true
  end

  create_table "hippo_developers", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 255
    t.string "atlassian_uid", limit: 255
    t.string "slack_member_id", limit: 255
    t.string "google_user_id", limit: 255
    t.string "bitbucket_uuid", limit: 255
    t.boolean "is_self_pr_reviewer"
    t.boolean "is_qa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_hippo_developers_on_email"
  end

  create_table "hippo_features", force: :cascade do |t|
    t.string "feature_group", limit: 255
    t.string "param_name", limit: 255
    t.string "default_value", limit: 255
    t.string "display_name", limit: 255
    t.integer "data_type", default: 1
    t.boolean "is_tenant_specific", default: false
    t.integer "filter_type", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_user_specific", default: false
    t.integer "group_id"
  end

  create_table "hippo_users", force: :cascade do |t|
    t.string "email", limit: 255
    t.integer "user_type", default: 1
    t.integer "permission_type", default: 1
    t.boolean "include_round_robin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "video_token", limit: 255
    t.string "drift_link", limit: 255
    t.integer "drift_id"
    t.bigint "crm_user_id", default: 0
    t.string "continent", limit: 255, default: [], array: true
    t.boolean "can_send_mail", default: false
    t.string "lead_phone_number", limit: 15
    t.string "aws_sns_arn", limit: 255
    t.string "slack_url", limit: 255
    t.string "calendly_link_30_min", limit: 255
  end

  create_table "humanize_asset_data", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "speaker_id"
    t.string "appconfig_path", limit: 255
    t.json "humanize_content"
  end

  create_table "humanize_speaker_data", force: :cascade do |t|
    t.string "speaker_name", limit: 255
    t.json "speaker_data"
  end

  create_table "hv_available_mediums", force: :cascade do |t|
    t.string "medium_name", limit: 255
    t.string "utm_source", limit: 255
    t.string "referer", limit: 255
  end

  create_table "hv_contexts", force: :cascade do |t|
    t.string "hv_context_name", limit: 255
    t.integer "hv_context_type"
    t.string "unique_id", limit: 255
    t.bigint "tenant_id"
    t.bigint "org_user_id"
    t.boolean "is_deleted", default: false
    t.datetime "last_activity_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "page_id"
    t.index ["unique_id"], name: "index_hv_contexts_on_unique_id"
  end

  create_table "hv_links", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "asset_id"
    t.bigint "esa_id"
    t.bigint "org_user_id"
    t.string "share_link", limit: 255
    t.bigint "hv_context_id"
    t.boolean "is_shared", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hv_share_link_medium_stats", force: :cascade do |t|
    t.integer "hv_available_medium_id"
    t.bigint "hv_links_id"
    t.bigint "hv_context_id"
    t.bigint "tenant_id"
    t.bigint "org_user_id"
    t.integer "open_count", default: 0
    t.integer "view_count", default: 0
    t.integer "play_count", default: 0
    t.integer "reply_count", default: 0
    t.bigint "contact_id"
    t.bigint "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.text "s3bucket"
    t.text "s3key"
    t.text "filename"
    t.integer "imagetype"
    t.integer "size"
    t.integer "tenant_id"
    t.float "duration", default: 0.0
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "qualification", limit: 255
    t.string "email", limit: 255
    t.integer "phone"
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "integration_details", force: :cascade do |t|
    t.integer "integ_type"
    t.string "integ_name", limit: 255
    t.json "integ_config", default: {}
    t.boolean "is_dynamic_integ"
    t.string "integ_plan_param", limit: 255
    t.boolean "is_tenant_specific", default: false
  end

  create_table "integration_orders", force: :cascade do |t|
    t.integer "integration_id"
    t.integer "group_id"
    t.integer "integ_order"
  end

  create_table "integration_requests", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "org_user_id"
    t.text "name"
    t.integer "integ_type"
    t.datetime "created_at"
    t.text "description"
    t.index ["org_user_id"], name: "index_integration_requests_on_org_user_id"
    t.index ["tenant_id"], name: "index_integration_requests_on_tenant_id"
  end

  create_table "ip_range_countries", force: :cascade do |t|
    t.decimal "start_range"
    t.decimal "end_range"
    t.string "country_code", limit: 255
    t.string "country", limit: 255
    t.index ["end_range"], name: "index_ip_range_countries_on_end_range"
    t.index ["start_range"], name: "index_ip_range_countries_on_start_range"
  end

  create_table "kcc_personalization_data", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "status"
    t.json "user_input", default: {}
    t.json "confidence_percentage", default: {}
    t.string "location", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "external_service_asset_id"
    t.index ["tenant_id"], name: "index_kcc_personalization_data_on_tenant_id"
  end

  create_table "kinesis_consumers", force: :cascade do |t|
    t.string "stream_name", limit: 255
    t.string "shard_id", limit: 255
    t.datetime "last_fetch_time", default: "2020-04-07 04:07:39"
    t.text "next_shard_iterator"
    t.string "sequence_number", limit: 255
    t.bigint "queue_lag_time", default: 0
    t.string "region"
    t.string "beanstalk_environment"
    t.integer "empty_for_last_x_times", default: 0
    t.datetime "created_at"
    t.index ["stream_name", "shard_id"], name: "index_kinesis_consumers_on_stream_name_and_shard_id", unique: true
  end

  create_table "kinesis_fallbacks", force: :cascade do |t|
    t.string "region"
    t.string "stream_name"
    t.string "shard_id"
    t.string "partition_key"
    t.text "data"
    t.integer "retry_count", default: 0
    t.string "bean_stalk_environment"
    t.index ["region", "stream_name", "shard_id"], name: "index_kinesis_fallbacks_on_region_and_stream_name_and_shard_id"
  end

  create_table "lead_action_insights", force: :cascade do |t|
    t.integer "plan_type"
    t.string "individual_segment", limit: 255
    t.json "insight_params"
    t.datetime "created_at"
  end

  create_table "lead_actions", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "total_score", default: 0
    t.json "basic_action_params", default: {}
    t.json "intermediate_action_params", default: {}
    t.json "lead_action_params", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "score_at_conversion", default: 0
    t.json "actions_at_conversion", default: {}
    t.integer "trial_lead_score", default: 0
    t.jsonb "free_lead_score", default: {}
    t.jsonb "paid_lead_score", default: {}
    t.index ["tenant_id"], name: "index_lead_actions_on_tenant_id"
  end

  create_table "lead_configs", id: :bigint, default: -> { "nextval('lead_configs_seq'::regclass)" }, force: :cascade do |t|
    t.integer "lead_type"
    t.string "lead_name", limit: 255
    t.integer "lead_score"
    t.integer "lead_id"
    t.integer "plan_type"
    t.integer "deleted", default: 0
    t.string "display_name", limit: 255
    t.string "group_name", limit: 255
    t.integer "data_type"
  end

  create_table "lead_criteria", force: :cascade do |t|
    t.string "criteria_name", limit: 255
    t.json "criteria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_service_assets", force: :cascade do |t|
    t.string "primary_field", limit: 255
    t.json "data"
    t.index ["primary_field"], name: "index_mail_service_assets_on_primary_field"
  end

  create_table "matching_choices", primary_key: ["quiz_component_id", "option_id"], force: :cascade do |t|
    t.bigint "quiz_component_id", null: false
    t.string "option_label", limit: 255
    t.integer "order"
    t.boolean "case_sensitive"
    t.bigint "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "option_id", null: false
    t.string "correct_answer", limit: 255
  end

  create_table "members", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "user_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id"], name: "index_members_on_tenant_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "merge_fields", force: :cascade do |t|
    t.string "resource_name", limit: 255
    t.json "resource_fields"
    t.boolean "fetch_custom_fields", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missed_crm_leads", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "crm_lead_id", default: 0
    t.text "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multi_branding_settings", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "theme_title", limit: 255
    t.string "portal_url", limit: 255
    t.string "domain_name", limit: 255
    t.json "image_sources", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "player_logo_id"
    t.bigint "top_bar_logo_id"
    t.string "top_bar_logo_link", limit: 255
    t.string "player_logo_link", limit: 255
    t.bigint "fav_icon_id"
    t.boolean "cd_enabled", default: false
    t.boolean "add_link_to_top_bar", default: false
    t.boolean "add_link_to_player_logo", default: false
    t.string "player_theme", limit: 255
    t.string "brand_colors", limit: 255, default: [], array: true
    t.string "brand_font", limit: 100
    t.string "brand_font_color", limit: 30
    t.boolean "default_theme", default: false
    t.string "from_email", limit: 255
    t.string "team_name", limit: 255
    t.text "signature"
    t.json "white_label_info", default: {}
    t.index ["domain_name"], name: "index_multi_branding_settings_on_domain_name", unique: true
    t.index ["portal_url"], name: "index_multi_branding_settings_on_portal_url", unique: true
    t.index ["tenant_id"], name: "index_multi_branding_settings_on_tenant_id"
  end

  create_table "notification_batch_counts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "notification_type"
    t.index ["notification_type"], name: "index_notification_batch_counts_on_notification_type"
  end

  create_table "one_time_play_urls", force: :cascade do |t|
    t.bigint "asset_id"
    t.integer "play_count", default: 0
    t.integer "expiry_time"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operation_statuses", force: :cascade do |t|
    t.integer "operationtype"
    t.integer "reference_id"
    t.integer "status"
    t.json "data"
  end

  create_table "org_email_templates", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "email_template_categories_id"
    t.integer "email_template_types_id"
    t.string "name", limit: 255
    t.string "subject", limit: 255
    t.integer "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "content"
    t.integer "module"
    t.index ["email_template_types_id"], name: "index_org_email_templates_on_email_template_types_id"
    t.index ["tenant_id"], name: "index_org_email_templates_on_tenant_id"
  end

  create_table "org_group_courses", primary_key: ["org_group_id", "course_id"], force: :cascade do |t|
    t.integer "org_group_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taken_count", default: 0
  end

  create_table "org_group_quizzes", primary_key: ["org_group_id", "quiz_id"], force: :cascade do |t|
    t.integer "org_group_id", null: false
    t.integer "quiz_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taken_count", default: 0
  end

  create_table "org_group_users", primary_key: ["org_group_id", "org_user_id"], force: :cascade do |t|
    t.integer "org_group_id", null: false
    t.integer "org_user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_groups", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active"
    t.string "join_code", limit: 255
    t.boolean "allow_self_register"
  end

  create_table "org_settings", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "player_logo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "top_bar_logo_id"
    t.string "top_bar_logo_link", limit: 255
    t.string "player_logo_link", limit: 255
    t.integer "fav_icon_id"
    t.string "page_title", limit: 255
    t.integer "portal_id"
    t.boolean "add_link_to_top_bar", default: false
    t.boolean "add_link_to_player_logo", default: false
    t.boolean "change_page_title", default: false
    t.string "player_theme", limit: 10
    t.integer "global_cta_id"
    t.boolean "global_cta_enabled", default: false
    t.boolean "category_to_all", default: false
    t.boolean "is_demo_account", default: false
    t.string "brand_colors", limit: 255, default: [], array: true
    t.string "brand_font", limit: 100
    t.string "brand_font_color", limit: 30
    t.integer "timestamp_type", default: 2
    t.integer "timestamp_secs", default: 120
    t.json "image_sources", default: {}
    t.boolean "is_default_global_cta_added", default: false
    t.integer "default_global_cta_id"
    t.json "persona_feature_params", default: {}
    t.json "tenant_expiry_params"
    t.integer "brand_home_logo_id"
    t.string "ph_company_id", limit: 255
    t.string "from_email", limit: 255
    t.string "team_name", limit: 255
    t.text "signature"
    t.json "white_label_info", default: {}
    t.bigint "brand_fav_icon_id"
    t.integer "embed_allow_type", limit: 2, default: 1
    t.text "embed_allow_origins"
    t.boolean "embed_self_open", default: true
  end

  create_table "org_user_configurations", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "org_user_id"
    t.integer "on_boarding_data", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["org_user_id"], name: "index_org_user_configurations_on_org_user_id"
    t.index ["tenant_id"], name: "index_org_user_configurations_on_tenant_id"
  end

  create_table "org_user_courses", primary_key: ["org_user_id", "course_id"], force: :cascade do |t|
    t.integer "org_user_id", null: false
    t.integer "course_id", null: false
    t.integer "num_attempts"
    t.integer "group_ids", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_user_quizzes", primary_key: ["org_user_id", "quiz_id"], force: :cascade do |t|
    t.integer "org_user_id", null: false
    t.integer "quiz_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "num_attempts", default: 0
    t.integer "group_ids", default: [], array: true
  end

  create_table "org_user_specific_data", force: :cascade do |t|
    t.integer "org_user_id"
    t.integer "tenant_id"
    t.integer "default_sales_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "default_video_comments_enabled"
    t.integer "default_video_reactions_enabled"
    t.string "facebook_link", limit: 255
    t.string "linkedin_link", limit: 255
    t.string "twitter_link", limit: 255
    t.string "calendar_link", limit: 255
    t.integer "intro_asset_id"
    t.integer "outro_asset_id"
    t.integer "default_thumbnail_type"
    t.integer "default_video_autoplay_enabled"
    t.boolean "allow_desktop_video_notifications", default: true
    t.boolean "allow_email_video_notifications", default: true
    t.boolean "allow_email_multiple_video_notifications", default: true
    t.boolean "allow_video_reply_notifications", default: true
    t.boolean "email_notifications_for_unknown_contact", default: false
    t.boolean "place_icon_in_gmail_toolbox", default: false
    t.integer "default_folder_id"
    t.json "image_sources", default: {}
    t.integer "pinned_categories", default: [], array: true
    t.boolean "video_privacy_enabled", default: false
    t.string "password", limit: 255
    t.integer "expiry_days", default: 0
    t.datetime "last_privacy_updated_at"
    t.json "extra_details"
    t.boolean "is_migrated", default: false
    t.index ["intro_asset_id"], name: "index_org_user_specific_data_on_intro_asset_id"
    t.index ["outro_asset_id"], name: "index_org_user_specific_data_on_outro_asset_id"
  end

  create_table "org_users", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password", limit: 255
    t.boolean "invited", default: true
    t.string "encrypted_password", limit: 255
    t.string "current_sign_in_at", limit: 255
    t.string "last_sign_in_at", limit: 255
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.integer "sign_in_count"
    t.integer "image_id"
    t.integer "role"
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email", limit: 255
    t.boolean "skip_confirm_change_password"
    t.integer "active"
    t.integer "taken_count", default: 0
    t.integer "total_quiz", default: 0
    t.string "join_code", limit: 255
    t.json "custom_question_answers", default: {}
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "user_name", limit: 255
    t.string "time_zone", limit: 255
    t.integer "total_course", default: 0
    t.string "gdrive_folder_id", limit: 255
    t.integer "created_by"
    t.string "referer", limit: 255
    t.json "lead_params", default: {}
    t.integer "lead_score", default: 0
    t.bigint "crm_lead_id", default: 0
    t.string "name", limit: 255
    t.boolean "announcement_exist"
    t.json "user_params", default: {}
    t.integer "campaign_mail"
    t.boolean "is_sales_user", default: false
    t.bigint "crm_contact_id"
    t.datetime "last_usage_activity"
    t.boolean "is_support", default: false
    t.boolean "is_marketing", default: false
    t.string "phone_country", limit: 255
    t.string "designation"
    t.bigint "profile_id"
    t.string "company_name", limit: 255
    t.integer "param_last_updated"
    t.string "user_locale", limit: 255, default: "en"
    t.bigint "hs_contact_id", default: 0
    t.json "image_source", default: {}
    t.integer "left_bar_log_id"
    t.index ["email"], name: "index_org_users_on_email"
    t.index ["profile_id"], name: "index_org_users_on_profile_id"
    t.index ["tenant_id"], name: "index_org_users_on_tenant_id"
  end

  create_table "page_templates_privacy_settings", force: :cascade do |t|
    t.bigint "tenant_id"
    t.integer "template_id"
    t.integer "permission_type"
    t.integer "privacy_type"
    t.integer "visible_to", array: true
    t.bigint "updated_by"
    t.boolean "is_custom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "created_by"
    t.index ["is_custom"], name: "index_page_templates_privacy_settings_on_is_custom"
    t.index ["template_id"], name: "index_page_templates_privacy_settings_on_template_id"
    t.index ["tenant_id"], name: "index_page_templates_privacy_settings_on_tenant_id"
  end

  create_table "paid_conversions", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "free_plan_id"
    t.integer "paid_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "renewal_type", default: 0
    t.boolean "renewal_status", default: true
    t.integer "coupon", default: 0
    t.string "event_id", limit: 255
    t.integer "plan_amount", default: 0
    t.integer "invoice_id", default: 0
    t.string "addon", limit: 255, default: [], array: true
    t.bigint "crm_deal_id", default: 0
  end

  create_table "personalised_video_groups", force: :cascade do |t|
    t.bigint "personalised_asset_id"
    t.integer "authoring_assets_id"
    t.bigint "media_id"
    t.float "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["authoring_assets_id"], name: "index_personalised_video_groups_on_authoring_assets_id"
    t.index ["personalised_asset_id"], name: "index_personalised_video_groups_on_personalised_asset_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.integer "searchable_id"
    t.string "searchable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_contents", force: :cascade do |t|
    t.integer "plan_id"
    t.string "card_name", limit: 255
    t.string "term", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "content"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "expiry_period", limit: 255
    t.json "plan_params", default: {}
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "product", default: 1
    t.integer "license_type"
    t.integer "num_expiry_days", default: -1
    t.boolean "is_team", default: false
    t.boolean "active", default: false
    t.json "price", default: {}
    t.integer "card_no", default: -1
    t.integer "plan_types", default: [], array: true
    t.string "display_name", limit: 50, default: "PRO"
    t.string "plan_tag", limit: 20
    t.boolean "is_life_time", default: false
  end

  create_table "portal_settings", primary_key: "portal_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "show_group"
    t.boolean "show_report"
    t.boolean "allow_rename_id"
    t.string "rename_id", limit: 255
    t.boolean "allow_self_register"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "default_groups", default: [], array: true
    t.string "allowed_ips", limit: 255, default: [], array: true
  end

  create_table "portals", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "title", limit: 255
    t.text "description"
    t.string "language", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "portal_url", limit: 255
    t.integer "logo_id"
    t.string "domain_name", limit: 255
    t.boolean "domain_signup_enabled", default: false
    t.boolean "cd_enabled", default: false
    t.string "company_name", limit: 255
    t.boolean "gdrive_sync", default: false
    t.integer "domain_authority", default: 0
    t.boolean "proedit_enabled", default: false
    t.index ["tenant_id"], name: "index_portals_on_tenant_id"
  end

  create_table "pqa_actions", force: :cascade do |t|
    t.integer "action_id"
    t.string "action_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pql_action_category_mappings", force: :cascade do |t|
    t.integer "action_category_id"
    t.integer "pql_action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pql_actions", force: :cascade do |t|
    t.integer "action_id"
    t.string "action_name", limit: 255
    t.string "display_name", limit: 255
    t.datetime "updated_at"
  end

  create_table "private_quiz_shared_emails", primary_key: ["quiz_assign_setting_id", "email_id"], force: :cascade do |t|
    t.string "email_id", limit: 255, null: false
    t.string "quiz_password", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "phone", limit: 255
    t.integer "num_attempts", default: 0
    t.bigint "quiz_assign_setting_id", null: false
  end

  create_table "product_feedback_forms", force: :cascade do |t|
    t.integer "user_id"
    t.text "feedback"
    t.integer "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_vs_permissions", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "permission_id"
    t.integer "tenant_id"
    t.integer "created_by", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id", "profile_id"], name: "index_profile_vs_permissions_on_tenant_id_and_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.integer "cloned_from"
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "updated_by"
    t.string "type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "basic", default: false
    t.boolean "admin", default: false
    t.boolean "export", default: false
    t.integer "theme_id"
    t.index ["tenant_id"], name: "index_profiles_on_tenant_id"
  end

  create_table "prospects_drift", force: :cascade do |t|
    t.string "email", limit: 255
    t.json "prospect_data"
    t.bigint "owner_id"
    t.string "conversation_id", limit: 255
    t.bigint "crm_lead_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "prospect_type"
    t.string "utm_source", limit: 255
    t.bigint "crm_contact_id"
    t.bigint "crm_account_id"
    t.index ["email"], name: "index_prospects_drift_on_email"
  end

  create_table "public_questions", force: :cascade do |t|
    t.text "question"
    t.text "explanation"
    t.string "tags", limit: 255
    t.string "hints", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "answers", default: [], array: true
    t.text "question_choices", default: [], array: true
    t.integer "question_order"
    t.integer "public_quiz_id"
    t.string "field_type", limit: 255
  end

  create_table "public_quizzes", force: :cascade do |t|
    t.bigint "org_id"
    t.string "name", limit: 255
    t.string "display_name", limit: 255
    t.text "description"
    t.string "created_by", limit: 255
    t.integer "quiz_type"
    t.integer "time_of_quiz"
    t.string "language", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "tags", limit: 255
  end

  create_table "question_marks_settings", primary_key: ["quiz_score_setting_id", "question_id"], force: :cascade do |t|
    t.integer "question_id", null: false
    t.float "mark"
    t.float "negative_mark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "quiz_score_setting_id", null: false
  end

  create_table "question_options", id: false, force: :cascade do |t|
    t.integer "cta_questions_id"
    t.string "option_1", limit: 255
    t.string "option_2", limit: 255
    t.string "option_3", limit: 255
    t.string "option_4", limit: 255
    t.index ["cta_questions_id"], name: "index_question_options_on_cta_questions_id"
  end

  create_table "question_order_settings", primary_key: "test_taking_setting_id", id: :bigint, default: nil, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "shuffle_type"
    t.integer "question_selection_type", limit: 2, default: 0
    t.integer "question_selected_value", default: 0
    t.integer "question_per_page", default: 0
    t.integer "review_answers", limit: 2, default: 0
    t.integer "reveal_answer_type", default: 0
  end

  create_table "questions", primary_key: "quiz_component_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "question_type"
    t.text "question"
    t.text "explanation"
    t.text "hint"
    t.integer "marks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "mandatory"
    t.boolean "horizontal"
    t.boolean "randomize"
    t.integer "max_characters"
    t.string "question_icon_file_name", limit: 255
    t.string "question_icon_content_type", limit: 255
    t.integer "question_icon_file_size"
    t.datetime "question_icon_updated_at"
    t.integer "image_id"
    t.integer "categories", default: [], array: true
    t.text "answer_explanation"
  end

  create_table "quiz_assign_settings", primary_key: "quiz_setting_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "assign_type"
    t.integer "login_required", limit: 2
    t.text "email_custom_content"
    t.boolean "ask_name"
    t.boolean "ask_email"
    t.boolean "ask_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "email_mandatory", default: false
    t.boolean "name_mandatory", default: false
    t.boolean "phone_mandatory", default: false
    t.boolean "allow_self_register", default: false
    t.string "join_code", limit: 255
  end

  create_table "quiz_availability_settings", primary_key: "quiz_setting_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "enabled", limit: 2, default: 0
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "grace_needed"
    t.datetime "grace_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "no_of_attempts"
    t.integer "time_to_complete"
  end

  create_table "quiz_certificate_templates", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "template_id"
    t.string "condition", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_components", force: :cascade do |t|
    t.bigint "quiz_id"
    t.string "label", limit: 255
    t.string "fieldtype", limit: 255
    t.string "placeholder", limit: 255
    t.string "inputsize", limit: 255
    t.text "helptext"
    t.boolean "required"
    t.string "fieldname", limit: 255
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "question_order"
    t.index ["quiz_id", "fieldname"], name: "index_quiz_components_on_quiz_id_and_fieldname", unique: true
  end

  create_table "quiz_notification_settings", primary_key: "quiz_setting_id", id: :bigint, default: nil, force: :cascade do |t|
    t.boolean "update_owner"
    t.string "update_email", limit: 255
    t.integer "update_type"
    t.boolean "email_after_each_attemp"
    t.boolean "update_lead"
    t.string "lead_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "items_to_quiz_taker"
    t.integer "items_to_specific_id"
    t.integer "admin_template_id"
    t.integer "test_takers_template_id"
    t.integer "others_template_id"
  end

  create_table "quiz_score_settings", primary_key: "quiz_setting_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "maximum_score"
    t.boolean "negative_marks_allowed"
    t.integer "quiz_grade_type"
    t.integer "pass_percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "score_assign_type", default: 0
    t.integer "equal_negative_mark", default: 0
  end

  create_table "quiz_security_settings", primary_key: "test_taking_setting_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "security_type"
    t.string "quiz_url", limit: 255
    t.string "quiz_pwd", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "disable_print"
    t.boolean "disable_copy"
    t.boolean "disable_download"
    t.integer "private_share_options"
    t.boolean "allow_self_register"
    t.string "join_code", limit: 255
  end

  create_table "quiz_settings", primary_key: "quiz_id", id: :bigint, default: nil, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_versions", primary_key: ["quiz_root_id", "quiz_id"], force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.integer "quiz_root_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "name", limit: 255
    t.string "display_name", limit: 255
    t.text "description"
    t.integer "status"
    t.string "created_by", limit: 255
    t.integer "quiz_type"
    t.boolean "save_resume"
    t.string "language", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "active", default: 0
    t.bigint "logo_id"
    t.integer "quiz_mode", default: 1
    t.integer "categories", default: [], array: true
    t.index ["tenant_id"], name: "index_quizzes_on_tenant_id"
  end

  create_table "rbac_groups", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.integer "tenant_id"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id"], name: "index_rbac_groups_on_tenant_id"
  end

  create_table "rbac_permissions", force: :cascade do |t|
    t.string "module_name", limit: 255
    t.integer "module_type"
    t.string "permission", limit: 255
    t.text "required_plan_param"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "module_ui_name", limit: 255
    t.string "permission_ui_name", limit: 255
    t.integer "module_serial_number"
    t.integer "permission_serial_number"
  end

  create_table "record_errors", force: :cascade do |t|
    t.integer "state"
    t.integer "token_type"
    t.string "token", limit: 255
    t.string "integration_type", limit: 255
    t.string "uid", limit: 255
  end

  create_table "recording_groups", force: :cascade do |t|
    t.bigint "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
  end

  create_table "recording_groups_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_1_authoring_id_idx"
    t.index ["id"], name: "recording_groups_1_id_idx"
    t.index ["media_id"], name: "recording_groups_1_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_1_tenant_id_idx"
  end

  create_table "recording_groups_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_10_authoring_id_idx"
    t.index ["id"], name: "recording_groups_10_id_idx"
    t.index ["media_id"], name: "recording_groups_10_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_10_tenant_id_idx"
  end

  create_table "recording_groups_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_11_authoring_id_idx"
    t.index ["id"], name: "recording_groups_11_id_idx"
    t.index ["media_id"], name: "recording_groups_11_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_11_tenant_id_idx"
  end

  create_table "recording_groups_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_12_authoring_id_idx"
    t.index ["id"], name: "recording_groups_12_id_idx"
    t.index ["media_id"], name: "recording_groups_12_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_12_tenant_id_idx"
  end

  create_table "recording_groups_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_13_authoring_id_idx"
    t.index ["id"], name: "recording_groups_13_id_idx"
    t.index ["media_id"], name: "recording_groups_13_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_13_tenant_id_idx"
  end

  create_table "recording_groups_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_14_authoring_id_idx"
    t.index ["id"], name: "recording_groups_14_id_idx"
    t.index ["media_id"], name: "recording_groups_14_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_14_tenant_id_idx"
  end

  create_table "recording_groups_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_15_authoring_id_idx"
    t.index ["id"], name: "recording_groups_15_id_idx"
    t.index ["media_id"], name: "recording_groups_15_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_15_tenant_id_idx"
  end

  create_table "recording_groups_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_16_authoring_id_idx"
    t.index ["id"], name: "recording_groups_16_id_idx"
    t.index ["media_id"], name: "recording_groups_16_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_16_tenant_id_idx"
  end

  create_table "recording_groups_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_17_authoring_id_idx"
    t.index ["id"], name: "recording_groups_17_id_idx"
    t.index ["media_id"], name: "recording_groups_17_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_17_tenant_id_idx"
  end

  create_table "recording_groups_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_18_authoring_id_idx"
    t.index ["id"], name: "recording_groups_18_id_idx"
    t.index ["media_id"], name: "recording_groups_18_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_18_tenant_id_idx"
  end

  create_table "recording_groups_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_19_authoring_id_idx"
    t.index ["id"], name: "recording_groups_19_id_idx"
    t.index ["media_id"], name: "recording_groups_19_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_19_tenant_id_idx"
  end

  create_table "recording_groups_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_2_authoring_id_idx"
    t.index ["id"], name: "recording_groups_2_id_idx"
    t.index ["media_id"], name: "recording_groups_2_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_2_tenant_id_idx"
  end

  create_table "recording_groups_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_20_authoring_id_idx"
    t.index ["id"], name: "recording_groups_20_id_idx"
    t.index ["media_id"], name: "recording_groups_20_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_20_tenant_id_idx"
  end

  create_table "recording_groups_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_3_authoring_id_idx"
    t.index ["id"], name: "recording_groups_3_id_idx"
    t.index ["media_id"], name: "recording_groups_3_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_3_tenant_id_idx"
  end

  create_table "recording_groups_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_4_authoring_id_idx"
    t.index ["id"], name: "recording_groups_4_id_idx"
    t.index ["media_id"], name: "recording_groups_4_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_4_tenant_id_idx"
  end

  create_table "recording_groups_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_5_authoring_id_idx"
    t.index ["id"], name: "recording_groups_5_id_idx"
    t.index ["media_id"], name: "recording_groups_5_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_5_tenant_id_idx"
  end

  create_table "recording_groups_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_6_authoring_id_idx"
    t.index ["id"], name: "recording_groups_6_id_idx"
    t.index ["media_id"], name: "recording_groups_6_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_6_tenant_id_idx"
  end

  create_table "recording_groups_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_7_authoring_id_idx"
    t.index ["id"], name: "recording_groups_7_id_idx"
    t.index ["media_id"], name: "recording_groups_7_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_7_tenant_id_idx"
  end

  create_table "recording_groups_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_8_authoring_id_idx"
    t.index ["id"], name: "recording_groups_8_id_idx"
    t.index ["media_id"], name: "recording_groups_8_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_8_tenant_id_idx"
  end

  create_table "recording_groups_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('recording_groups_id_seq'::regclass)" }
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["authoring_id"], name: "recording_groups_9_authoring_id_idx"
    t.index ["id"], name: "recording_groups_9_id_idx"
    t.index ["media_id"], name: "recording_groups_9_media_id_idx"
    t.index ["tenant_id"], name: "recording_groups_9_tenant_id_idx"
  end

  create_table "recording_groups_migration", id: :bigint, default: -> { "nextval('recording_groups_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "authoring_id"
    t.string "group_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "media_id"
    t.integer "group_id"
    t.bigint "tenant_id"
    t.index ["media_id"], name: "recording_groups_media_id_id_idx"
    t.index ["tenant_id"], name: "index_recording_groups_on_tenant_id"
  end

  create_table "referral_buckets", force: :cascade do |t|
    t.integer "bucket_number"
    t.integer "plan_type"
    t.string "segment", limit: 255
    t.integer "referral_plan_id", default: 3001
    t.index ["plan_type", "segment"], name: "referral_buckets_idx2"
  end

  create_table "referral_features", force: :cascade do |t|
    t.string "feature", limit: 255
    t.string "config_name", limit: 255
    t.string "allowed_value", limit: 255
  end

  create_table "referral_plans", force: :cascade do |t|
    t.string "referral_name", limit: 255
    t.boolean "enabled"
    t.datetime "enabled_from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "release_notes", force: :cascade do |t|
    t.jsonb "jira_tasks"
    t.string "build_owner", limit: 255
    t.boolean "is_published"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "build_env"
    t.index ["is_published"], name: "index_release_notes_on_is_published"
  end

  create_table "resource_doc_attachments", force: :cascade do |t|
    t.string "doc_content_file_name", limit: 255
    t.string "doc_content_content_type", limit: 255
    t.integer "doc_content_file_size"
    t.datetime "doc_content_updated_at"
    t.integer "user_id"
    t.boolean "is_converted"
    t.string "converted_type", limit: 255
    t.string "converted_file_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_media_attachments", force: :cascade do |t|
    t.string "media_content_file_name", limit: 255
    t.string "media_content_content_type", limit: 255
    t.integer "media_content_file_size"
    t.datetime "media_content_updated_at"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "s_social_codes", force: :cascade do |t|
    t.string "code", limit: 255
    t.integer "deal_type"
    t.integer "status", default: 0
    t.bigint "tenant_id"
  end

  create_table "sales_page_template_and_id_mappings", force: :cascade do |t|
    t.bigint "template_page_id"
    t.bigint "new_sales_page_id"
    t.bigint "hv_context_id"
    t.bigint "tenant_id"
    t.bigint "org_user_id"
  end

  create_table "salesloft_user_mappings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "user_guid", limit: 255
    t.integer "user_key_id"
    t.index ["user_guid"], name: "index_salesloft_user_mappings_on_user_guid"
    t.index ["user_id"], name: "index_salesloft_user_mappings_on_user_id"
  end

  create_table "saml_provider", force: :cascade do |t|
    t.string "provider", limit: 255
    t.text "cert"
    t.string "target_url", limit: 255
    t.string "url", limit: 255
    t.string "metadata", limit: 255
    t.string "domain", limit: 255
    t.text "slo_url"
  end

  create_table "security_alerts_settings", primary_key: "accounts_id", id: :integer, default: nil, force: :cascade do |t|
    t.boolean "send_email"
    t.boolean "ssl"
    t.boolean "show_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "security_issue_trackers", force: :cascade do |t|
    t.string "hacker_name", limit: 255
    t.string "hacker_link", limit: 255
    t.string "bug_title", limit: 255
    t.text "bug_description"
    t.boolean "eligible_for_hof"
    t.integer "bug_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", limit: 255, null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "authentication_token", limit: 255
    t.integer "browser_type_id"
    t.index ["authentication_token"], name: "sessions_auth_token_idx"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
  end

  create_table "shorten_url_stats", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "shorten_url_id"
    t.string "referer", limit: 255
    t.json "user_agent"
    t.string "remote_ip", limit: 100
    t.datetime "created_at"
  end

  create_table "shorten_urls", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "share_url", limit: 1000
    t.datetime "created_at"
    t.bigint "view_count"
    t.bigint "org_user_id"
  end

  create_table "sign_in_out_issue_trackers", force: :cascade do |t|
    t.string "email", limit: 255
    t.string "entry_type", limit: 255
    t.string "referer", limit: 255
    t.integer "current_tenant_id"
    t.integer "session_tenant_id"
    t.integer "thread_tenant_id"
    t.text "user_agent"
    t.datetime "entry_time"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "splitandrender_processing_stats", force: :cascade do |t|
    t.bigint "asset_id"
    t.bigint "inprogress_id"
    t.bigint "version_id"
    t.integer "operation_type"
    t.float "processing_time"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "stage_build_details", force: :cascade do |t|
    t.string "stage_name", limit: 255
    t.string "branch_name", limit: 255
    t.string "developer_name", limit: 255
    t.string "build_version", limit: 255
    t.boolean "stage_in_use"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "ended_at"
    t.boolean "build_in_stage"
  end

  create_table "static_assets", force: :cascade do |t|
    t.text "asset_url"
    t.string "genre", limit: 255
    t.integer "asset_type"
    t.string "asset_name", limit: 255
    t.string "s3bucket", limit: 255
    t.string "s3key", limit: 255
    t.boolean "is_default", default: false
    t.bigint "media_id"
    t.float "duration"
  end

  create_table "sub_rev_langs", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "subtile_lang", limit: 255
    t.string "rev_lang", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_activities", force: :cascade do |t|
    t.string "event_id", limit: 255
    t.string "event_type", limit: 255
    t.string "subscription_id", limit: 255
    t.string "email", limit: 255
    t.datetime "occured_at"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["subscription_id"], name: "index_subscription_activities_on_subscription_id"
  end

  create_table "subtitles", force: :cascade do |t|
    t.integer "transcribe_id"
    t.integer "media_id"
    t.integer "asset_id"
    t.integer "is_subtitles_enabled", default: 1
    t.boolean "notify", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "file_name", limit: 255
    t.string "language", limit: 255
    t.boolean "default_subtitle", default: false
    t.boolean "ai_editor", default: false
  end

  create_table "task_lists", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "list_name", limit: 255
    t.text "list_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id", "list_name"], name: "index_task_lists_on_tenant_id_and_list_name", unique: true
    t.index ["tenant_id"], name: "index_task_lists_on_tenant_id"
  end

  create_table "task_set_task_maps", force: :cascade do |t|
    t.integer "task_set_id", null: false
    t.integer "task_id", null: false
    t.integer "reward_points"
    t.integer "serial_number", null: false
    t.integer "is_active", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_sets", force: :cascade do |t|
    t.integer "checklist_id"
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.integer "is_active"
    t.integer "serial_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deactivated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.integer "eta"
    t.json "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "template_modules", force: :cascade do |t|
    t.integer "template_id"
    t.integer "modules", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenant_actions_trackers", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "action_category_id"
    t.json "action_performed", default: {}
    t.datetime "last_performed_at"
    t.integer "score", default: 0
    t.integer "license_type"
    t.json "monthly_actions", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "daily_actions", default: {}
    t.integer "org_user_id"
  end

  create_table "tenant_keys", primary_key: "tenant_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "api_key", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenant_plans", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "plan_id"
    t.datetime "expiry_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "cb_customer_id", limit: 255
    t.string "cb_plan_id", limit: 255
    t.string "cb_status", limit: 255
    t.datetime "cb_current_term_start"
    t.datetime "cb_current_term_end"
    t.string "cb_event_type", limit: 255
    t.string "cb_invoice_id", limit: 255
    t.integer "product", default: 1
    t.boolean "share_count_exceed", default: false
    t.integer "plan_type"
    t.json "org_params"
    t.string "individual_segment", limit: 255
    t.integer "video_usage_exceeds", default: 0
    t.integer "num_referred", default: 0
    t.integer "lead_score_exceeds", default: 0
    t.datetime "referral_expiry_time"
    t.datetime "next_reset_time"
    t.integer "allocated_free_plan"
    t.integer "business_segment", default: [], array: true
    t.datetime "moved_to_free_at"
    t.string "addon", limit: 255, default: [], array: true
    t.string "signup_purpose", limit: 255
    t.integer "migrated", limit: 2
    t.integer "onboarding_status", array: true
    t.string "cb_mrr", limit: 255
    t.integer "cb_plan_quantity"
    t.bigint "crm_account_id"
    t.bigint "crm_deal_id"
    t.boolean "is_paused", default: false
    t.boolean "is_cancelled", default: false
    t.integer "used_pause_count", default: 0
    t.bigint "resume_date"
    t.bigint "pause_date"
    t.integer "youtube_export_count", default: 0
    t.integer "criteria_id"
    t.integer "pop_type", default: 0
    t.datetime "nudge_pop_expires_on"
    t.integer "pop_actions", default: [], array: true
    t.string "selected_occupation", limit: 255
    t.json "user_pilot_answers"
    t.integer "param_last_updated"
    t.index ["individual_segment"], name: "index_tenant_plans_on_individual_segment"
    t.index ["tenant_id", "plan_id"], name: "index_tenant_plans_on_tenant_id_and_plan_id", unique: true
  end

  create_table "tenant_pqa_action_mappings", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "action_ids", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenant_pql_summarys", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "pu_score", default: 0
    t.integer "ro_score", default: 0
    t.integer "icp_score", default: 0
    t.integer "total_score", default: 0
    t.integer "license_type"
    t.json "monthly_scoring", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "org_user_id"
    t.integer "progressive_score"
  end

  create_table "tenant_referrers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "referred_user_id"
    t.datetime "referred_on"
    t.datetime "referer_logged_in_at"
    t.integer "status"
    t.string "email", limit: 255
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_tenant_referrers_on_tenant_id"
  end

  create_table "tenant_video_usages", primary_key: "tenant_id", id: :integer, default: nil, force: :cascade do |t|
    t.bigint "total_bytes_consumed", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "monthly_data", default: {}
    t.bigint "consumed_by_share", default: 0
    t.bigint "consumed_by_export", default: 0
    t.bigint "consumed_by_download", default: 0
    t.float "consumed_by_subtitles", default: 0.0
  end

  create_table "tenants", force: :cascade do |t|
    t.integer "tenant_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_tenants_on_name"
    t.index ["tenant_id"], name: "index_tenants_on_tenant_id"
  end

  create_table "tenants_users", primary_key: ["user_id", "tenant_id"], force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "user_id", null: false
    t.index ["tenant_id", "user_id"], name: "index_tenants_users_on_tenant_id_and_user_id"
  end

  create_table "test_data", force: :cascade do |t|
    t.bigint "test_details_id"
    t.text "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "quiz_component_id"
    t.integer "is_correct"
    t.text "correct_answer"
    t.float "score"
    t.text "feedback"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "user_answer_id", limit: 255
    t.index ["quiz_component_id"], name: "index_test_data_on_quiz_component_id"
    t.index ["test_details_id"], name: "index_test_data_on_test_details_id"
  end

  create_table "test_details", force: :cascade do |t|
    t.bigint "quiz_id"
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "phone", limit: 255
    t.integer "num_questions"
    t.integer "num_correct"
    t.float "score"
    t.integer "status"
    t.text "result"
    t.integer "num_incorrect"
    t.text "remote_ip"
    t.integer "max_score"
    t.boolean "validation_complete"
    t.integer "portal_user_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.json "custom_question_answers", default: {}
    t.string "user_name", limit: 255
    t.index ["email"], name: "index_test_details_on_email"
    t.index ["portal_user_id"], name: "index_test_details_on_portal_user_id"
    t.index ["quiz_id"], name: "index_test_details_on_quiz_id"
  end

  create_table "test_result_presentation_settings", primary_key: "quiz_setting_id", id: :bigint, default: nil, force: :cascade do |t|
    t.boolean "show_certificate"
    t.integer "certificate_type"
    t.integer "certificate_template_id"
    t.string "condition", limit: 255
    t.integer "report_availability"
    t.boolean "show_custom_msg"
    t.boolean "show_score"
    t.boolean "show_result"
    t.boolean "show_try_again"
    t.integer "certificate_score"
    t.text "custom_msg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "company_name", limit: 255
  end

  create_table "test_taking_settings", primary_key: "quiz_setting_id", id: :bigint, default: nil, force: :cascade do |t|
    t.string "language", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonial_custom_fields", force: :cascade do |t|
    t.bigint "video_categories_id"
    t.bigint "custom_field_id"
    t.integer "field_order", default: 1
    t.boolean "enabled", default: true
    t.index ["custom_field_id"], name: "index_testimonial_custom_fields_on_custom_field_id"
    t.index ["video_categories_id"], name: "index_testimonial_custom_fields_on_video_categories_id"
  end

  create_table "third_party_details", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "crm_lead_id"
    t.bigint "crm_contact_id"
    t.bigint "crm_account_id"
    t.bigint "crm_deal_id"
    t.string "cb_customer_id", limit: 255
    t.string "cb_plan_id", limit: 255
    t.string "cb_status", limit: 255
    t.datetime "cb_current_term_start"
    t.datetime "cb_current_term_end"
    t.string "cb_event_type", limit: 255
    t.string "cb_invoice_id", limit: 255
    t.string "cb_mrr", limit: 255
    t.integer "cb_plan_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id"], name: "index_third_party_details_on_tenant_id", unique: true
  end

  create_table "third_party_keys", force: :cascade do |t|
    t.integer "portal_id"
    t.json "tp_keys"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "third_party_trackers", force: :cascade do |t|
    t.string "tracker_name", limit: 255
    t.text "tracking_code"
    t.string "track_condition", limit: 255
    t.string "environment", limit: 255
    t.boolean "is_enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "before_hv_js", default: false
    t.json "exclusive_tracker_conditions"
  end

  create_table "thumb_performance_stats", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
    t.datetime "updated_at"
  end

  create_table "thumb_performance_stats_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "thumb_performance_stats_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('thumb_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.bigint "page_id"
    t.string "track_id", limit: 255
    t.datetime "created_at"
    t.decimal "thumb_type", precision: 2
    t.decimal "thumb_channel_type", precision: 2
    t.string "session_id", limit: 200
    t.string "utm_source", limit: 100
    t.bigint "api_time"
    t.bigint "thumb_size"
    t.bigint "personalization_time"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.integer "asset_type"
  end

  create_table "track_transcribe_jobs", force: :cascade do |t|
    t.string "job_name", limit: 255
    t.integer "transcriber"
    t.json "output"
    t.integer "status"
    t.string "bucket", limit: 255
    t.string "key", limit: 255
    t.datetime "started_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "job_id", limit: 255
  end

  create_table "transcoding_stats", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "asset_id"
    t.integer "media_id"
    t.integer "inprogess_id"
    t.string "job_id", limit: 255
    t.bigint "transcode_time"
    t.integer "input_resolution"
    t.integer "output_resolution"
    t.integer "input_fps"
    t.boolean "contains_audio"
    t.bigint "input_size"
    t.bigint "output_size"
    t.bigint "overall_time"
    t.integer "state"
    t.datetime "created_at"
    t.float "queue_waiting_time"
  end

  create_table "trigger_table", force: :cascade do |t|
    t.string "table_name", limit: 255
    t.string "op_type", limit: 255
    t.bigint "pk_id"
    t.datetime "last_updated"
  end

  create_table "unauth_user_activities", force: :cascade do |t|
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
    t.datetime "updated_at"
    t.index ["activity_requests_id"], name: "index_unauth_user_activities_on_activity_requests_id"
  end

  create_table "unauth_user_activities_apr_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_aug_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_dec_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_feb_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_feb_2021", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_jan_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_jul_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_jul_2020", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_jun_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_mar_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_may_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_nov_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_oct_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_oct_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "unauth_user_activities_sep_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "activity_requests_id"
    t.string "token", limit: 255
    t.bigint "asset_id"
    t.string "session_id", limit: 255
    t.datetime "created_at"
    t.bigint "tenant_id"
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.bigint "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count", default: 0
    t.string "session_id", limit: 255
    t.index ["activity_requests_id"], name: "index_user_activities_on_activity_requests_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_activities_apr_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_feb_2020", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_feb_2021", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
    t.string "session_id", limit: 255
  end

  create_table "user_activities_jul_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_jun_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_jun_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_mar_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_mar_2020", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_may_2018", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_may_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_activities_oct_2019", id: false, force: :cascade do |t|
    t.bigint "id"
    t.integer "user_id"
    t.integer "activity_requests_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "hit_count"
  end

  create_table "user_browser_types", force: :cascade do |t|
    t.integer "org_user_id"
    t.text "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "remote_ip", limit: 255
    t.text "referer_url"
    t.json "client_info"
  end

  create_table "user_checklist_task_completions", force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "task_id", null: false
    t.integer "action", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "org_user_id"
  end

  create_table "user_enrichment_data", force: :cascade do |t|
    t.integer "org_user_id"
    t.json "person_data"
    t.json "company_data"
    t.json "error_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "email_data"
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_user_enrichment_data_on_tenant_id"
  end

  create_table "user_key_values", id: false, force: :cascade do |t|
    t.integer "org_user_id"
    t.string "key", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_keys", id: :serial, force: :cascade do |t|
    t.integer "org_user_id", null: false
    t.json "access_params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "integ_type", null: false
    t.string "uid", limit: 255
    t.integer "tenant_id"
    t.index ["org_user_id", "integ_type"], name: "user_keys_org_user_id_integ_type_key", unique: true
  end

  create_table "user_push_details", force: :cascade do |t|
    t.text "grant_token"
    t.integer "user_id"
    t.json "device_type"
    t.boolean "is_mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "device_specific_token", default: {}
    t.index ["user_id"], name: "index_user_push_details_on_user_id"
  end

  create_table "user_role_persona_mappings", force: :cascade do |t|
    t.string "user_role", limit: 255
    t.string "user_persona", limit: 255
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "role"
    t.integer "plan_id"
    t.json "role_params"
    t.string "role_name", limit: 255
    t.index ["role", "plan_id"], name: "index_user_roles_on_role_and_plan_id", unique: true
  end

  create_table "user_settings", force: :cascade do |t|
    t.integer "portal_id"
    t.boolean "ask_name", default: true
    t.boolean "ask_email", default: true
    t.boolean "ask_phone", default: true
    t.boolean "name_mandatory", default: true
    t.boolean "email_mandatory", default: true
    t.boolean "phone_mandatory", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_specific_cta", force: :cascade do |t|
    t.integer "org_user_id"
    t.integer "cta_type"
    t.integer "cta_component_id"
    t.boolean "enabled", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_testimonials", force: :cascade do |t|
    t.integer "owner_id"
    t.string "customer_email", limit: 255
    t.datetime "expires_on"
    t.string "digest", limit: 255
    t.integer "num_attempts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email", limit: 255
    t.boolean "skip_confirm_change_password", default: false
    t.integer "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "time_zone", limit: 255
    t.integer "time_zone_id"
    t.string "profile_picture_file_name", limit: 255
    t.string "profile_picture_content_type", limit: 255
    t.integer "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string "provider", limit: 255
    t.string "uid", limit: 255
    t.text "access_token"
    t.text "refresh_token"
    t.string "authentication_token", limit: 255
    t.boolean "show_get_started_page", default: true
    t.string "api_key", limit: 255
    t.integer "invalid_api_key_attempt", default: 0
    t.integer "trial_status", default: 0
    t.string "utm_source", limit: 255
    t.string "utm_medium", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "given_name", limit: 255
    t.text "referer_url"
    t.string "referrer_token", limit: 255
    t.string "offer_code", limit: 255
    t.string "affiliate_provider", limit: 255
    t.string "utm_campaign", limit: 255
    t.string "utm_content", limit: 255
    t.boolean "unsubscribe_email", default: false
    t.string "country_continent", limit: 255
    t.text "landing_page"
    t.boolean "templates_added", default: false
    t.integer "lead_assigned", default: 0
    t.boolean "ask_company_details", default: true
    t.integer "gs_state", default: 13
    t.string "utm_landing_page", limit: 255
    t.integer "user_flag", default: 0
    t.json "utm_json"
    t.datetime "reset_auth_token_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unconfirmed_email"], name: "index_users_on_unconfirmed_email"
  end

  create_table "utm_campaigns", force: :cascade do |t|
    t.string "campaign_name", limit: 255
    t.integer "plan_type"
    t.string "individual_segment", limit: 255
    t.boolean "show_sub_category", default: false
  end

  create_table "vd_anonymous_mappings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "tenant_id"
    t.bigint "stats_id"
    t.bigint "visitor_id"
    t.bigint "hv_context_id"
    t.bigint "hv_available_medium_id"
    t.index ["hv_context_id", "hv_available_medium_id"], name: "context_and_medium_index"
    t.index ["hv_context_id"], name: "index_vd_anonymous_mappings_on_hv_context_id"
    t.index ["id"], name: "index_vd_anonymous_mappings_on_id"
    t.index ["stats_id"], name: "index_vd_anonymous_mappings_on_stats_id"
    t.index ["tenant_id"], name: "index_vd_anonymous_mappings_on_tenant_id"
    t.index ["visitor_id"], name: "index_vd_anonymous_mappings_on_visitor_id"
  end

  create_table "vd_asset_mappings", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "bigint"
    t.integer "stats_id"
    t.integer "asset_folder_id"
    t.integer "integer"
    t.integer "asset_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], name: "index_vd_asset_mappings_on_id"
    t.index ["stats_id"], name: "index_vd_asset_mappings_on_stats_id"
    t.index ["tenant_id"], name: "index_vd_asset_mappings_on_tenant_id"
  end

  create_table "vd_campaign_mappings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "tenant_id"
    t.bigint "stats_id"
    t.bigint "campaign_id"
    t.integer "campaign_referer"
  end

  create_table "vd_contact_mappings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "tenant_id"
    t.bigint "stats_id"
    t.bigint "contact_id"
    t.integer "context_id"
    t.integer "activity_id"
  end

  create_table "vd_esa_mappings", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.bigint "tenant_id"
    t.bigint "stats_id"
    t.bigint "esa_id"
    t.integer "esa_referer"
  end

  create_table "video_campaign_queues", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.string "to", limit: 255
    t.integer "mail_content_id"
    t.integer "status"
    t.json "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "ext_service_asset_ids", default: [], array: true
    t.json "thumbnail_data"
    t.string "beankstalk_environment"
  end

  create_table "video_campaigns", force: :cascade do |t|
    t.text "subject"
    t.integer "gmail_token_id"
    t.integer "drive_token_id"
    t.string "drive_file_id", limit: 255
    t.integer "assets", default: [], array: true
    t.json "merge_fields"
    t.text "cc"
    t.text "bcc"
    t.integer "tenant_id"
    t.integer "org_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "referer"
    t.integer "parent_campaign_id"
    t.integer "child_campaign_triggered_from"
    t.integer "is_imported_from"
    t.integer "email_template_id"
    t.boolean "sent_summary_mail", default: false
    t.datetime "scheduled_at", default: -> { "now()" }
    t.string "from_mail", limit: 255
    t.string "campaign_name", limit: 255
    t.integer "campaign_type"
    t.integer "campaign_state"
    t.json "state_json"
    t.integer "display_mode"
    t.string "redirect_url", limit: 255
    t.integer "custom_asset"
    t.index ["gmail_token_id"], name: "index_video_campaigns_on_gmail_token_id"
    t.index ["org_user_id"], name: "index_video_campaigns_on_org_user_id"
    t.index ["referer"], name: "index_video_campaigns_on_referer"
    t.index ["scheduled_at"], name: "index_video_campaigns_on_scheduled_at"
    t.index ["tenant_id"], name: "index_video_campaigns_on_tenant_id"
  end

  create_table "video_cat_custom_fields", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "field_name", limit: 255
    t.bigint "parent_field_id", default: -1
    t.boolean "is_mandatory", default: false
    t.integer "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id"], name: "index_video_cat_custom_fields_on_tenant_id"
  end

  create_table "video_categories", force: :cascade do |t|
    t.string "name", limit: 255
    t.bigint "parent_id"
    t.integer "tenant_id"
    t.integer "visible_to", array: true
    t.integer "visibility_type", default: 1
    t.string "thumbnail_img", limit: 255
    t.integer "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "folder_type", default: 1
    t.integer "permission_type", default: 2
    t.text "folder_path"
    t.index ["tenant_id", "name", "folder_type"], name: "index_video_categories_on_tenant_id_and_name_and_folder_type", unique: true
  end

  create_table "video_categories_mappings", force: :cascade do |t|
    t.integer "authoring_asset_id"
    t.integer "video_categories_id"
    t.integer "org_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["authoring_asset_id", "video_categories_id"], name: "video_cat_map_unique_index", unique: true
  end

  create_table "video_categories_settings", force: :cascade do |t|
    t.integer "video_categories_id"
    t.boolean "ask_first_name", default: true
    t.boolean "ask_last_name", default: true
    t.boolean "ask_phone", default: true
    t.boolean "ask_email", default: true
    t.boolean "ask_notes", default: true
    t.boolean "set_record_duration", default: false
    t.boolean "allow_own_videos", default: true
    t.boolean "ask_consent", default: true
    t.float "maximum_duration", default: 2.0
    t.text "description"
    t.string "title", limit: 255
    t.text "thanku_message"
    t.boolean "allow_youtube_links", default: false
    t.text "consent_info"
    t.text "intro_video_thumb_url"
    t.integer "intro_video_asset_id"
    t.boolean "can_send_mail", default: true
    t.string "notify_email", limit: 255
  end

  create_table "video_completeds", force: :cascade do |t|
    t.integer "asset_id"
    t.json "operation_json"
    t.integer "operation_type"
    t.integer "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "instance_id", limit: 255
    t.integer "server_group_id"
    t.string "server_ip", limit: 255
    t.integer "num_retries"
    t.boolean "invalidate", default: false
    t.bigint "server_inprogress_id"
    t.index ["asset_id", "operation_type"], name: "index_video_completeds_on_asset_id_and_operation_type"
  end

  create_table "video_custom_trackers", force: :cascade do |t|
    t.integer "asset_id"
    t.string "tracking_id", limit: 255
    t.text "tracking_code"
    t.string "tags", limit: 255, default: [], array: true
    t.integer "tracker"
    t.integer "time_to_load"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_delivery_common_data", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_del_common_data_id_seq'::regclass)" }, null: false
    t.string "receiver_email_id", limit: 256
    t.string "receiver_name", limit: 256
    t.string "receiver_remote_ip", limit: 256
    t.integer "tenant_id", null: false
    t.integer "asset_id"
    t.integer "watch_count", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["asset_id"], name: "index_video_delivery_common_data_on_asset_id"
    t.index ["id"], name: "index_video_delivery_common_data_on_id"
    t.index ["tenant_id"], name: "index_video_delivery_common_data_on_tenant_id"
  end

  create_table "video_delivery_stats", force: :cascade do |t|
    t.bigint "asset_id"
    t.string "referer", limit: 255
    t.string "browser_type", limit: 255
    t.string "browser_version", limit: 255
    t.string "plat_form", limit: 255
    t.boolean "is_mobile"
    t.string "client_os", limit: 255
    t.string "country", limit: 255
    t.datetime "created_at"
    t.datetime "first_frame_load_time"
    t.integer "num_buffering", default: 0
    t.integer "view_type"
    t.boolean "is_play", default: false
    t.integer "play_percentage", default: 0
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "city", limit: 255
    t.integer "city_id"
    t.boolean "play_finished", default: false
    t.datetime "updated_at"
    t.bigint "page_stats_id"
    t.bigint "seconds_watched"
    t.bigint "visitor_id"
    t.bigint "media_id"
    t.bigint "tenant_id"
    t.bigint "bandwidth_consumed"
    t.bigint "video_created_by"
    t.bigint "script_id"
    t.integer "asset_shared_by"
    t.string "uuid", limit: 255
    t.index ["asset_id"], name: "index_video_delivery_stats_on_asset_id"
    t.index ["browser_type"], name: "index_video_delivery_stats_on_browser_type"
    t.index ["client_os"], name: "index_video_delivery_stats_on_client_os"
    t.index ["latitude", "longitude"], name: "index_video_delivery_stats_on_latitude_and_longitude"
    t.index ["media_id"], name: "index_video_delivery_stats_on_media_id"
    t.index ["page_stats_id"], name: "video_delivery_statspage_stats_id_idx"
    t.index ["script_id"], name: "index_video_delivery_stats_on_script_id"
    t.index ["tenant_id"], name: "index_video_delivery_stats_on_tenant_id"
    t.index ["uuid"], name: "index_video_delivery_stats_on_uuid"
    t.index ["video_created_by"], name: "index_video_delivery_stats_on_video_created_by"
    t.index ["visitor_id"], name: "index_video_delivery_stats_on_visitor_id"
  end

  create_table "video_delivery_user_details", force: :cascade do |t|
    t.integer "video_delivery_stats_id"
    t.string "remote_ip", limit: 255
    t.string "viewer_email", limit: 255
    t.string "viewer_name", limit: 255
    t.integer "referer"
    t.integer "referer_id"
    t.json "viewer_data"
    t.integer "contact_id"
    t.bigint "tenant_id"
    t.datetime "updated_at"
    t.index ["referer", "referer_id"], name: "index_video_delivery_user_details_on_referer_and_referer_id"
    t.index ["tenant_id"], name: "index_video_delivery_user_details_on_tenant_id"
    t.index ["video_delivery_stats_id"], name: "index_video_delivery_user_details_on_video_delivery_stats_id"
  end

  create_table "video_errors", force: :cascade do |t|
    t.json "operation_json"
    t.string "server_ip", limit: 255
    t.integer "num_retries"
    t.boolean "invalidate", default: false
    t.integer "operation_type"
    t.integer "asset_id"
    t.integer "error_code"
    t.integer "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "instance_id", limit: 255
    t.integer "server_group_id"
    t.bigint "server_inprogress_id"
    t.string "requested_instance", limit: 255
    t.bigint "sub_category_error_code", default: 0
    t.text "sub_category_error_msg"
    t.index ["asset_id", "operation_type"], name: "index_video_errors_on_asset_id_and_operation_type"
  end

  create_table "video_flow_details", force: :cascade do |t|
    t.integer "video_template_id"
    t.bigint "sales_page_id"
    t.bigint "hv_context_id"
    t.bigint "tenant_id"
    t.bigint "asset_ids", default: [], array: true
    t.json "additional_info"
  end

  create_table "video_gifs", force: :cascade do |t|
    t.integer "videoid"
    t.integer "gifid"
  end

  create_table "video_in_progresses", force: :cascade do |t|
    t.json "operation_json"
    t.string "server_ip", limit: 255
    t.integer "num_retries"
    t.boolean "invalidate", default: false
    t.integer "operation_type"
    t.integer "asset_id"
    t.integer "error_code"
    t.integer "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "instance_id", limit: 255
    t.integer "server_group_id"
    t.string "requested_instance", limit: 255
    t.bigint "sub_category_error_code", default: 0
    t.text "sub_category_error_msg"
    t.index ["asset_id", "operation_type"], name: "index_video_in_progresses_on_asset_id_and_operation_type"
    t.index ["server_group_id"], name: "index_video_in_progresses_on_server_group_id"
  end

  create_table "video_landing_pages", force: :cascade do |t|
    t.bigint "tenant_id"
    t.integer "template_id"
    t.json "template_json", default: {}
    t.integer "page_type", limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "merge_fields", limit: 255, default: [], array: true
    t.string "svg_url", limit: 255
    t.index ["template_id"], name: "index_video_landing_pages_on_template_id"
    t.index ["tenant_id"], name: "index_video_landing_pages_on_tenant_id"
  end

  create_table "video_page_asset_mappings", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "page_id"
    t.bigint "external_id"
    t.bigint "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["asset_id"], name: "index_video_page_asset_mappings_on_asset_id"
    t.index ["external_id"], name: "index_video_page_asset_mappings_on_external_id"
    t.index ["page_id"], name: "index_video_page_asset_mappings_on_page_id"
    t.index ["tenant_id"], name: "index_video_page_asset_mappings_on_tenant_id"
  end

  create_table "video_page_branding_settings", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "landing_page_id"
    t.bigint "fav_icon_id"
    t.string "thumbnail", limit: 255
    t.string "page_title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tenant_id", "landing_page_id"], name: "video_page_branding_settings_idx1"
  end

  create_table "video_page_custom_templates", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "template_id"
    t.string "name", limit: 255
    t.json "template_json"
    t.string "description", limit: 255
    t.string "svg_url", limit: 255
    t.bigint "created_by"
    t.string "template_file_path", limit: 255
    t.integer "page_type", limit: 2
    t.boolean "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "show_page_embed", limit: 255
    t.index ["is_deleted"], name: "index_video_page_custom_templates_on_is_deleted"
    t.index ["tenant_id"], name: "index_video_page_custom_templates_on_tenant_id"
  end

  create_table "video_page_delivery_stats", force: :cascade do |t|
    t.bigint "page_id"
    t.string "referrer", limit: 255
    t.string "browser_type", limit: 100
    t.string "browser_version", limit: 100
    t.string "plat_form", limit: 100
    t.boolean "is_mobile"
    t.string "client_os", limit: 50
    t.string "country", limit: 50
    t.string "city", limit: 255
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "viewer_email", limit: 150
    t.string "remote_ip", limit: 20
    t.string "local_ip", limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "visitor_id"
    t.bigint "tenant_id"
    t.string "uuid", limit: 255
    t.index ["page_id"], name: "index_video_page_delivery_stats_on_page_id"
    t.index ["tenant_id"], name: "index_video_page_delivery_stats_on_tenant_id"
    t.index ["uuid"], name: "index_video_page_delivery_stats_on_uuid"
    t.index ["visitor_id"], name: "index_video_page_delivery_stats_on_visitor_id"
  end

  create_table "video_page_integrations", force: :cascade do |t|
    t.bigint "page_id"
    t.bigint "tenant_id"
    t.string "tracker_id", limit: 255
    t.integer "tracker_type", limit: 2
    t.json "custom_fields", default: {}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "integ_enabled", default: true
    t.text "chat_copycode"
    t.index ["tenant_id", "page_id"], name: "index_video_page_integrations_on_tenant_id_and_page_id"
  end

  create_table "video_page_settings", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "page_id"
    t.string "name", limit: 255
    t.string "url_path", limit: 255
    t.string "fallback_url", limit: 255
    t.integer "privacy_option", limit: 2, default: 2
    t.bigint "fav_icon_id"
    t.string "thumbnail_bucket", limit: 255
    t.string "thumbnail_key", limit: 255
    t.string "page_title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "asset_id"
    t.boolean "is_default", default: false
    t.string "css_bucket_key", limit: 255
    t.integer "privacy_type", default: 1
    t.integer "visible_to", array: true
    t.bigint "created_by"
    t.integer "permission_type", default: 2
    t.boolean "is_deleted", default: false
    t.string "screenshot_thumbnail_key", limit: 255
    t.boolean "created_by_hv"
    t.json "image_sources", default: {}
    t.boolean "is_custom", default: false
    t.string "template_file_path", limit: 255
    t.integer "tags", array: true
    t.string "css_path", limit: 255
    t.integer "sales_page_type", limit: 2, default: 0
    t.boolean "editable_dynamic_content", default: true
    t.index "to_tsvector('english'::regconfig, (((COALESCE(name, ''::character varying))::text || ' '::text) || (COALESCE(url_path, ''::character varying))::text))", name: "video_page_settings_word_idx", using: :gin
    t.index ["asset_id"], name: "video_page_settings_asset_id_idx"
    t.index ["created_by_hv"], name: "index_video_page_settings_on_created_by_hv"
    t.index ["page_id"], name: "video_page_settings_page_id_idx"
    t.index ["tenant_id", "url_path"], name: "index_video_page_settings_on_tenant_id_and_url_path", unique: true
    t.index ["tenant_id"], name: "video_page_settings_tenant_id_idx"
  end

  create_table "video_page_templates", force: :cascade do |t|
    t.json "template_json", default: {}
    t.integer "page_type", limit: 2
    t.string "template_thumbnail", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 100
    t.string "template_image", limit: 255
    t.string "category_name", limit: 255
    t.integer "template_order"
    t.string "css_path", limit: 255
    t.string "template_file_path", limit: 255
    t.string "svg_url", limit: 255
    t.string "description", limit: 255
    t.string "show_condition", limit: 255
    t.string "show_page_embed", limit: 255
    t.boolean "is_deleted", default: false
    t.text "categories", default: [], array: true
  end

  create_table "video_performance_stats", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.boolean "is_closed_before_loading"
    t.string "utm_source", limit: 50
    t.string "played_location", limit: 100
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.string "uuid", limit: 255
    t.datetime "updated_at"
    t.index ["uuid"], name: "index_video_performance_stats_on_uuid"
  end

  create_table "video_performance_stats_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_performance_stats_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_performance_stats_id_seq'::regclass)" }, null: false
    t.bigint "tenant_id", null: false
    t.bigint "asset_id"
    t.decimal "asset_type", precision: 2
    t.bigint "media_id"
    t.bigint "stats_id"
    t.string "session_id", limit: 200
    t.decimal "channel_type", precision: 3
    t.datetime "first_load_time"
    t.bigint "total_loading_time"
    t.bigint "data_transferred"
    t.datetime "play_video_time"
    t.datetime "first_frame_load_time"
    t.integer "num_buffers"
    t.float "avg_buffer_loading_time"
    t.bigint "total_time_stayed"
    t.decimal "initial_resolution", precision: 4
    t.json "change_resolution"
    t.string "device_name", limit: 50
    t.string "browser_name", limit: 50
    t.decimal "personalised_type", precision: 2
    t.decimal "video_state", precision: 3, array: true
    t.integer "polling_time"
    t.json "cpu_memory"
    t.string "utm_source", limit: 50
    t.json "played_location"
    t.boolean "cdn_enabled"
    t.datetime "created_at"
    t.boolean "loading_completed", default: false
    t.bigint "page_id"
    t.boolean "transcoding_enabled", default: false
    t.decimal "page_template_id", precision: 5
    t.decimal "view_type", precision: 2
    t.datetime "asset_created_time"
    t.bigint "html_loading_time"
    t.bigint "check_privacy_api_time"
    t.bigint "play_video_api_time"
    t.boolean "is_self_view"
    t.integer "rtt_values", array: true
    t.bigint "stream_type"
  end

  create_table "video_privacy_settings", primary_key: "authoring_asset_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "privacy_type"
    t.string "password", limit: 255
    t.datetime "expiry_time"
    t.integer "url_expiry_period"
    t.integer "on_expiry_action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "encrypted_password", limit: 255
  end

  create_table "video_processing_stats", force: :cascade do |t|
    t.integer "media_id"
    t.float "preprocess_time"
    t.float "render_time"
    t.float "waiting_time"
    t.integer "resolution"
    t.integer "asset_id"
    t.boolean "immediate", default: false
    t.float "audio_render_time", default: 0.0
    t.float "video_render_time", default: 0.0
    t.float "merge_render_time", default: 0.0
    t.float "audio_compression_time", default: 0.0
    t.float "video_compression_time", default: 0.0
    t.float "image_compression_time", default: 0.0
    t.float "quickpreview_generation_time", default: 0.0
    t.float "thumbnail_generation_time", default: 0.0
    t.float "preview_generation_time", default: 0.0
    t.float "waveform_generation_time", default: 0.0
    t.float "mp3_conversion", default: 0.0
    t.float "mp4_conversion", default: 0.0
    t.float "total_conversion_time", default: 0.0
    t.bigint "inprogress_id"
    t.float "video_dummy_encode_time", default: 0.0
    t.float "image_plain_copy_time", default: 0.0
    t.float "video_copying_time", default: 0.0
    t.integer "operation_type", default: 0
    t.float "splitandrender_time"
    t.string "external_ids", limit: 255
    t.datetime "created_at"
    t.index ["asset_id", "media_id"], name: "index_video_processing_stats_on_asset_id_and_media_id", unique: true
    t.index ["inprogress_id"], name: "index_video_processing_stats_on_inprogress_id"
  end

  create_table "video_replace_stats", force: :cascade do |t|
    t.bigint "asset_id"
    t.bigint "media_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["asset_id"], name: "index_video_replace_stats_on_asset_id"
    t.index ["media_id"], name: "index_video_replace_stats_on_media_id"
  end

  create_table "video_replies_in_video_pages", force: :cascade do |t|
    t.bigint "page_id"
    t.bigint "asset_id"
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.text "message"
    t.boolean "is_submitted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "sales_rep_id"
    t.bigint "page_stats_id"
    t.bigint "primary_asset_id"
    t.index ["asset_id"], name: "index_video_replies_in_video_pages_on_asset_id"
    t.index ["page_id"], name: "index_video_replies_in_video_pages_on_page_id"
    t.index ["sales_rep_id"], name: "index_video_replies_in_video_pages_on_sales_rep_id"
  end

  create_table "video_scripts", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "title", limit: 255
    t.text "script_text"
    t.integer "visibility_type"
    t.integer "visible_to", array: true
    t.bigint "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_default", default: false
    t.boolean "is_first_script", default: false
    t.integer "permission_type", default: 1
    t.integer "tags", array: true
    t.index ["tenant_id"], name: "index_video_scripts_on_tenant_id"
  end

  create_table "video_stats", force: :cascade do |t|
    t.boolean "is_compress_requested", default: false
    t.bigint "media_id"
    t.float "samplerate", default: 0.0
    t.json "videodetails", default: {}
    t.string "codec", limit: 255
    t.string "colorcode", limit: 255
    t.float "framerate", default: 0.0
    t.float "bitrate", default: 0.0
    t.string "language", limit: 255
  end

  create_table "video_streamings", force: :cascade do |t|
    t.integer "media_id"
    t.string "s3bucket", limit: 255
    t.text "s3key"
    t.integer "transcoding_service", limit: 2, default: 0
    t.boolean "contains_audio", default: false
    t.integer "resolutions", default: [], array: true
    t.bigint "tenant_id"
    t.string "job_id", limit: 255
    t.integer "error_code", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json "resolution_status"
    t.integer "state"
    t.integer "transcoding_type"
    t.bigint "asset_id"
    t.boolean "enabled"
    t.integer "external_service_asset_id"
    t.index ["external_service_asset_id"], name: "index_video_streamings_on_external_service_asset_id"
    t.index ["media_id"], name: "video_streamings_media_id_idx"
    t.index ["tenant_id"], name: "index_video_streamings_on_tenant_id"
  end

  create_table "video_template_cards", force: :cascade do |t|
    t.integer "video_template_id"
    t.bigint "asset_id"
    t.bigint "slide_id"
    t.string "title", limit: 255
    t.string "sub_title", limit: 255
    t.integer "option"
    t.string "option_list", limit: 255, array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "script_id"
    t.string "script_description", limit: 255
    t.string "asset_type", limit: 255
    t.integer "bgm_volume_percent"
    t.bigint "virtual_bg_id"
    t.string "recording_type", limit: 255
  end

  create_table "video_templates", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "sales_page_id"
    t.bigint "bg_audio_id"
    t.string "template_name", limit: 255
    t.boolean "visibility", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "bgm_name", limit: 255
    t.integer "visibility_type", default: 1
    t.integer "visible_to", array: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "video_category_id"
    t.bigint "default_template_id"
    t.integer "permission_type", default: 2
    t.boolean "transition_enabled", default: true
    t.integer "template_order", default: -1
    t.integer "thumbnail_img"
    t.integer "tags", default: [], array: true
    t.text "components", default: [], array: true
    t.index ["tenant_id", "template_name"], name: "index_video_templates_on_tenant_id_and_template_name", unique: true
    t.index ["tenant_id"], name: "index_video_templates_on_tenant_id"
  end

  create_table "video_testimonial_details", force: :cascade do |t|
    t.bigint "asset_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "phone", limit: 255
    t.string "email", limit: 255
    t.text "notes"
    t.json "custom_values", default: {}
    t.index ["asset_id"], name: "index_video_testimonial_details_on_asset_id"
  end

  create_table "video_versions", force: :cascade do |t|
    t.bigint "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
  end

  create_table "video_versions_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_1_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_1_id_idx"
    t.index ["media_id"], name: "video_versions_1_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_1_tenant_id_idx"
  end

  create_table "video_versions_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_10_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_10_id_idx"
    t.index ["media_id"], name: "video_versions_10_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_10_tenant_id_idx"
  end

  create_table "video_versions_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_11_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_11_id_idx"
    t.index ["media_id"], name: "video_versions_11_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_11_tenant_id_idx"
  end

  create_table "video_versions_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_12_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_12_id_idx"
    t.index ["media_id"], name: "video_versions_12_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_12_tenant_id_idx"
  end

  create_table "video_versions_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_13_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_13_id_idx"
    t.index ["media_id"], name: "video_versions_13_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_13_tenant_id_idx"
  end

  create_table "video_versions_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_14_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_14_id_idx"
    t.index ["media_id"], name: "video_versions_14_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_14_tenant_id_idx"
  end

  create_table "video_versions_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_15_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_15_id_idx"
    t.index ["media_id"], name: "video_versions_15_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_15_tenant_id_idx"
  end

  create_table "video_versions_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_16_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_16_id_idx"
    t.index ["media_id"], name: "video_versions_16_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_16_tenant_id_idx"
  end

  create_table "video_versions_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_17_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_17_id_idx"
    t.index ["media_id"], name: "video_versions_17_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_17_tenant_id_idx"
  end

  create_table "video_versions_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_18_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_18_id_idx"
    t.index ["media_id"], name: "video_versions_18_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_18_tenant_id_idx"
  end

  create_table "video_versions_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_19_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_19_id_idx"
    t.index ["media_id"], name: "video_versions_19_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_19_tenant_id_idx"
  end

  create_table "video_versions_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_2_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_2_id_idx"
    t.index ["media_id"], name: "video_versions_2_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_2_tenant_id_idx"
  end

  create_table "video_versions_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_20_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_20_id_idx"
    t.index ["media_id"], name: "video_versions_20_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_20_tenant_id_idx"
  end

  create_table "video_versions_21", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_21_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_21_id_idx"
    t.index ["media_id"], name: "video_versions_21_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_21_tenant_id_idx"
  end

  create_table "video_versions_22", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_22_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_22_id_idx"
    t.index ["media_id"], name: "video_versions_22_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_22_tenant_id_idx"
  end

  create_table "video_versions_23", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_23_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_23_id_idx"
    t.index ["media_id"], name: "video_versions_23_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_23_tenant_id_idx"
  end

  create_table "video_versions_24", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_24_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_24_id_idx"
    t.index ["media_id"], name: "video_versions_24_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_24_tenant_id_idx"
  end

  create_table "video_versions_25", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_25_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_25_id_idx"
    t.index ["media_id"], name: "video_versions_25_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_25_tenant_id_idx"
  end

  create_table "video_versions_26", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_26_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_26_id_idx"
    t.index ["media_id"], name: "video_versions_26_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_26_tenant_id_idx"
  end

  create_table "video_versions_27", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_27_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_27_id_idx"
    t.index ["media_id"], name: "video_versions_27_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_27_tenant_id_idx"
  end

  create_table "video_versions_28", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_28_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_28_id_idx"
    t.index ["media_id"], name: "video_versions_28_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_28_tenant_id_idx"
  end

  create_table "video_versions_29", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_29_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_29_id_idx"
    t.index ["media_id"], name: "video_versions_29_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_29_tenant_id_idx"
  end

  create_table "video_versions_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_3_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_3_id_idx"
    t.index ["media_id"], name: "video_versions_3_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_3_tenant_id_idx"
  end

  create_table "video_versions_30", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_30_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_30_id_idx"
    t.index ["media_id"], name: "video_versions_30_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_30_tenant_id_idx"
  end

  create_table "video_versions_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_4_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_4_id_idx"
    t.index ["media_id"], name: "video_versions_4_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_4_tenant_id_idx"
  end

  create_table "video_versions_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_5_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_5_id_idx"
    t.index ["media_id"], name: "video_versions_5_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_5_tenant_id_idx"
  end

  create_table "video_versions_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_6_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_6_id_idx"
    t.index ["media_id"], name: "video_versions_6_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_6_tenant_id_idx"
  end

  create_table "video_versions_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_7_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_7_id_idx"
    t.index ["media_id"], name: "video_versions_7_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_7_tenant_id_idx"
  end

  create_table "video_versions_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_8_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_8_id_idx"
    t.index ["media_id"], name: "video_versions_8_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_8_tenant_id_idx"
  end

  create_table "video_versions_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('video_versions_id_seq'::regclass)" }
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "video_versions_9_authoring_asset_id_idx"
    t.index ["id"], name: "video_versions_9_id_idx"
    t.index ["media_id"], name: "video_versions_9_media_id_idx"
    t.index ["tenant_id"], name: "video_versions_9_tenant_id_idx"
  end

  create_table "video_versions_bin", force: :cascade do |t|
    t.integer "media_id"
    t.integer "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["media_id"], name: "index_video_versions_bin_on_media_id"
  end

  create_table "video_versions_migration", id: :bigint, default: -> { "nextval('video_versions_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "authoring_asset_id"
    t.integer "media_id"
    t.json "project_json"
    t.float "version"
    t.boolean "is_rendered"
    t.json "extra_params"
    t.boolean "preview", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "state", default: 5
    t.bigint "tenant_id"
    t.index ["authoring_asset_id"], name: "index_video_versions_on_authoring_asset_id"
    t.index ["media_id"], name: "video_versions_media_id_idx"
    t.index ["tenant_id"], name: "index_video_versions_on_tenant_id"
  end

  create_table "video_waiting_queues", force: :cascade do |t|
    t.json "operation_json"
    t.integer "priority", default: 0
    t.boolean "immediate", default: false
    t.integer "operation_type"
    t.integer "asset_id"
    t.integer "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "server_group_id"
    t.index ["asset_id", "operation_type"], name: "index_video_waiting_queues_on_asset_id_and_operation_type"
    t.index ["server_group_id"], name: "index_video_waiting_queues_on_server_group_id"
  end

  create_table "videos", force: :cascade do |t|
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
  end

  create_table "videos_1", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_1_duration_idx"
    t.index ["id"], name: "videos_1_id_idx"
    t.index ["tenant_id"], name: "videos_1_tenant_id_idx"
  end

  create_table "videos_10", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_10_duration_idx"
    t.index ["id"], name: "videos_10_id_idx"
    t.index ["tenant_id"], name: "videos_10_tenant_id_idx"
  end

  create_table "videos_11", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_11_duration_idx"
    t.index ["id"], name: "videos_11_id_idx"
    t.index ["tenant_id"], name: "videos_11_tenant_id_idx"
  end

  create_table "videos_12", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_12_duration_idx"
    t.index ["id"], name: "videos_12_id_idx"
    t.index ["tenant_id"], name: "videos_12_tenant_id_idx"
  end

  create_table "videos_13", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_13_duration_idx"
    t.index ["id"], name: "videos_13_id_idx"
    t.index ["tenant_id"], name: "videos_13_tenant_id_idx"
  end

  create_table "videos_14", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_14_duration_idx"
    t.index ["id"], name: "videos_14_id_idx"
    t.index ["tenant_id"], name: "videos_14_tenant_id_idx"
  end

  create_table "videos_15", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_15_duration_idx"
    t.index ["id"], name: "videos_15_id_idx"
    t.index ["tenant_id"], name: "videos_15_tenant_id_idx"
  end

  create_table "videos_16", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_16_duration_idx"
    t.index ["id"], name: "videos_16_id_idx"
    t.index ["tenant_id"], name: "videos_16_tenant_id_idx"
  end

  create_table "videos_17", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_17_duration_idx"
    t.index ["id"], name: "videos_17_id_idx"
    t.index ["tenant_id"], name: "videos_17_tenant_id_idx"
  end

  create_table "videos_18", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_18_duration_idx"
    t.index ["id"], name: "videos_18_id_idx"
    t.index ["tenant_id"], name: "videos_18_tenant_id_idx"
  end

  create_table "videos_19", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_19_duration_idx"
    t.index ["id"], name: "videos_19_id_idx"
    t.index ["tenant_id"], name: "videos_19_tenant_id_idx"
  end

  create_table "videos_2", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_2_duration_idx"
    t.index ["id"], name: "videos_2_id_idx"
    t.index ["tenant_id"], name: "videos_2_tenant_id_idx"
  end

  create_table "videos_20", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_20_duration_idx"
    t.index ["id"], name: "videos_20_id_idx"
    t.index ["tenant_id"], name: "videos_20_tenant_id_idx"
  end

  create_table "videos_21", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_21_duration_idx"
    t.index ["id"], name: "videos_21_id_idx"
    t.index ["tenant_id"], name: "videos_21_tenant_id_idx"
  end

  create_table "videos_22", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_22_duration_idx"
    t.index ["id"], name: "videos_22_id_idx"
    t.index ["tenant_id"], name: "videos_22_tenant_id_idx"
  end

  create_table "videos_23", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_23_duration_idx"
    t.index ["id"], name: "videos_23_id_idx"
    t.index ["tenant_id"], name: "videos_23_tenant_id_idx"
  end

  create_table "videos_24", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_24_duration_idx"
    t.index ["id"], name: "videos_24_id_idx"
    t.index ["tenant_id"], name: "videos_24_tenant_id_idx"
  end

  create_table "videos_25", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_25_duration_idx"
    t.index ["id"], name: "videos_25_id_idx"
    t.index ["tenant_id"], name: "videos_25_tenant_id_idx"
  end

  create_table "videos_26", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_26_duration_idx"
    t.index ["id"], name: "videos_26_id_idx"
    t.index ["tenant_id"], name: "videos_26_tenant_id_idx"
  end

  create_table "videos_27", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_27_duration_idx"
    t.index ["id"], name: "videos_27_id_idx"
    t.index ["tenant_id"], name: "videos_27_tenant_id_idx"
  end

  create_table "videos_28", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_28_duration_idx"
    t.index ["id"], name: "videos_28_id_idx"
    t.index ["tenant_id"], name: "videos_28_tenant_id_idx"
  end

  create_table "videos_29", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_29_duration_idx"
    t.index ["id"], name: "videos_29_id_idx"
    t.index ["tenant_id"], name: "videos_29_tenant_id_idx"
  end

  create_table "videos_3", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_3_duration_idx"
    t.index ["id"], name: "videos_3_id_idx"
    t.index ["tenant_id"], name: "videos_3_tenant_id_idx"
  end

  create_table "videos_30", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_30_duration_idx"
    t.index ["id"], name: "videos_30_id_idx"
    t.index ["tenant_id"], name: "videos_30_tenant_id_idx"
  end

  create_table "videos_4", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_4_duration_idx"
    t.index ["id"], name: "videos_4_id_idx"
    t.index ["tenant_id"], name: "videos_4_tenant_id_idx"
  end

  create_table "videos_5", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_5_duration_idx"
    t.index ["id"], name: "videos_5_id_idx"
    t.index ["tenant_id"], name: "videos_5_tenant_id_idx"
  end

  create_table "videos_6", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_6_duration_idx"
    t.index ["id"], name: "videos_6_id_idx"
    t.index ["tenant_id"], name: "videos_6_tenant_id_idx"
  end

  create_table "videos_7", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_7_duration_idx"
    t.index ["id"], name: "videos_7_id_idx"
    t.index ["tenant_id"], name: "videos_7_tenant_id_idx"
  end

  create_table "videos_8", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_8_duration_idx"
    t.index ["id"], name: "videos_8_id_idx"
    t.index ["tenant_id"], name: "videos_8_tenant_id_idx"
  end

  create_table "videos_9", id: false, force: :cascade do |t|
    t.bigint "id", default: -> { "nextval('videos_id_seq'::regclass)" }
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.bigint "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
    t.index ["duration"], name: "videos_9_duration_idx"
    t.index ["id"], name: "videos_9_id_idx"
    t.index ["tenant_id"], name: "videos_9_tenant_id_idx"
  end

  create_table "videos_migration", id: :bigint, default: -> { "nextval('videos_id_seq'::regclass)" }, force: :cascade do |t|
    t.text "s3bucket"
    t.text "s3key"
    t.text "s3bucket_compressed"
    t.text "filename"
    t.integer "videotype"
    t.integer "size"
    t.boolean "public"
    t.text "link"
    t.integer "tenant_id"
    t.text "s3videokey_compressed"
    t.text "s3audiokey_compressed"
    t.text "s3thumbnailkey"
    t.float "duration"
    t.float "width"
    t.float "height"
    t.float "offset"
    t.float "audioduration"
    t.text "quick_preview"
    t.boolean "is_compressed", default: false
    t.text "s3waveformkey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "contains_video", default: false
    t.boolean "contains_audio", default: false
    t.boolean "contains_image", default: false
    t.boolean "is_processed", default: false
    t.integer "bitrate"
    t.integer "audio_bitrate"
    t.integer "can_stream", default: 1
  end

  create_table "vimeo_categories", force: :cascade do |t|
    t.string "c_key", limit: 255
    t.string "c_name", limit: 255
    t.json "subcategories"
  end

  create_table "virtual_bg_stats", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "rendered_media_id"
    t.integer "source_video"
    t.integer "background_video"
    t.integer "virtualbg_video"
    t.integer "state"
    t.boolean "is_revert"
  end

  create_table "virtualbg_background_images", id: :serial, force: :cascade do |t|
    t.string "s3bucket"
    t.string "s3key"
    t.string "s3_img"
    t.string "compressed_video"
    t.boolean "is_video"
    t.integer "video_type"
    t.string "title", limit: 255, default: ""
    t.integer "status_id"
  end

  create_table "visitor_to_contact_maps", force: :cascade do |t|
    t.bigint "visitor_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "conversion_time", default: -> { "now()" }, null: false
    t.index ["visitor_id", "contact_id"], name: "index_visitor_to_contact_maps_on_visitor_id_and_contact_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.datetime "created_time", default: -> { "now()" }, null: false
    t.index ["tenant_id", "id"], name: "index_visitors_on_tenant_id_and_id"
  end

  create_table "webhook_endpoints", force: :cascade do |t|
    t.string "url", limit: 255
    t.integer "events", default: [], array: true
    t.integer "tenant_id"
    t.boolean "is_blocked"
    t.string "secret_key", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "webhook_type", default: 1
  end

  create_table "webhook_event_completeds", force: :cascade do |t|
    t.string "unique_event_id", limit: 255
    t.integer "event_type"
    t.integer "event_type_id"
    t.integer "tenant_id"
    t.json "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "stat_id"
  end

  create_table "webhook_event_retries", force: :cascade do |t|
    t.string "unique_event_id", limit: 255
    t.integer "event_type"
    t.integer "event_type_id"
    t.integer "tenant_id"
    t.integer "retry_count"
    t.json "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "webhook_endpoint_id", default: -1
  end

  create_table "webhook_events", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "method_name", limit: 255
    t.string "class_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webhook_pending_events", force: :cascade do |t|
    t.integer "event_type"
    t.integer "event_type_id"
    t.integer "tenant_id"
    t.json "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "whitelisted_urls", force: :cascade do |t|
    t.string "domain", limit: 255
    t.string "sub_domain", limit: 255
    t.string "host_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zoho_crm_failed_stats", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "module_id"
    t.integer "method"
    t.text "data"
    t.integer "failed_status"
    t.string "url", limit: 255
    t.text "failed_reason"
    t.datetime "created_at"
    t.datetime "next_retry_at"
    t.datetime "updated_at"
    t.index ["module_id"], name: "index_zoho_crm_failed_stats_on_module_id"
    t.index ["tenant_id"], name: "index_zoho_crm_failed_stats_on_tenant_id"
  end

  add_foreign_key "activity_notifications", "org_users", column: "user_id", name: "activity_notifications_user_id_fk1", on_delete: :cascade
  add_foreign_key "contact_activities", "visitors", name: "visitor_id_fkey", on_delete: :cascade
  add_foreign_key "cta_stats", "visitors", name: "visitor_id_fkey", on_delete: :cascade
  add_foreign_key "drive_app_files", "export_tokens", column: "export_user_id", name: "drive_app_files_fk1"
  add_foreign_key "entities", "authoring_assets_migration", column: "asset_id", name: "entities_fk1", on_delete: :cascade
  add_foreign_key "entity_comment", "entities", name: "entity_comment_fk1", on_delete: :cascade
  add_foreign_key "entity_reaction", "entities", name: "entity_reaction_fk1", on_delete: :cascade
  add_foreign_key "entity_reply", "entities", name: "entity_reply_fk1", on_delete: :cascade
  add_foreign_key "entity_reply", "entity_comment", column: "comment_id", primary_key: "entity_id", name: "entity_reply_fk2", on_delete: :cascade
  add_foreign_key "notification_batch_counts", "org_users", column: "user_id", name: "notification_batch_counts_user_id_fk1", on_delete: :cascade
  add_foreign_key "user_push_details", "org_users", column: "user_id", name: "user_push_details_user_id_fk1", on_delete: :cascade
  add_foreign_key "video_page_delivery_stats", "visitors", name: "visitor_id_fkey", on_delete: :cascade
  add_foreign_key "visitor_to_contact_maps", "contacts", name: "contact_id_fkey", on_delete: :cascade
  add_foreign_key "visitor_to_contact_maps", "visitors", name: "visitor_id_fkey", on_delete: :cascade
end
