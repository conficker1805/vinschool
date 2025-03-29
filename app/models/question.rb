class Question < ApplicationRecord
  # Associations
  has_many :answers
  belongs_to :question_template

  accepts_nested_attributes_for :answers
end
