class QuestionsController < ApplicationController
  def index
    @question = Question.includes(:question_template, :answers).all.sample
    # @question = Question.last

    render @question.question_template.answer_type
  end
end



