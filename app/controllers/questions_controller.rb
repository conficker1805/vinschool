class QuestionsController < ApplicationController
  def index
    question_type = params[:question_type] || :numbers_addition_subtraction
    # @question = Question.includes(:question_template, :answers).all.sample
    @question = Question.includes(:question_template, :answers).where(question_template: { question_type: }).sample
    # @question = QuestionTemplate.find_by(answer_type: :select_answer).questions.last
    # @question = Question.last

    @stimulus_controller = @question.question_template.answer_type.gsub('_', '-')

    render @question.question_template.answer_type
  end
end



