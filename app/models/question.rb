class Question < ApplicationRecord
  # Associations
  has_many :answers
  belongs_to :question_template

  accepts_nested_attributes_for :answers

  def json_attributes
    question_template.attributes.slice('question_type', 'answer_type').to_json
  end
end
