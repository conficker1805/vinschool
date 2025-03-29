# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_29_031314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "text"
    t.boolean "correct", default: false, null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "question_templates", force: :cascade do |t|
    t.text "slim_content", null: false
    t.integer "grade", null: false
    t.string "subject", null: false
    t.integer "chapter", null: false
    t.string "question_type", null: false
    t.string "answer_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_type"], name: "index_question_templates_on_answer_type"
    t.index ["question_type"], name: "index_question_templates_on_question_type"
    t.index ["slim_content"], name: "index_question_templates_on_slim_content"
    t.index ["subject"], name: "index_question_templates_on_subject"
  end

  create_table "questions", force: :cascade do |t|
    t.jsonb "options", default: {}, null: false
    t.bigint "question_template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_template_id"], name: "index_questions_on_question_template_id"
  end
end
