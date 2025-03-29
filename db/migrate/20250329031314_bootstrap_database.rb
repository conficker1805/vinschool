class BootstrapDatabase < ActiveRecord::Migration[8.0]
  def change
    create_table :question_templates do |t|
      t.text :slim_content, null: false, index: true
      t.integer :grade, null: false
      t.string :subject, null: false, index: true
      t.integer :chapter, null: false
      t.string :question_type, null: false, index: true # choice | input
      t.string :answer_type, null: false, index: true # single_choice | multiple_choices

      t.timestamps null: false
    end

    create_table :questions do |t|
      t.jsonb :options, default: {}, null: false
      t.references :question_template, null: false, index: true

      t.timestamps null: false
    end

    create_table :answers do |t|
      t.text :text
      t.boolean :correct, default: false, null: false
      t.references :question, null: false, index: true

      t.timestamps null: false
    end
  end
end
