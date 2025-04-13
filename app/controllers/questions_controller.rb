class QuestionsController < ApplicationController
  def index
    question_type = params[:question_type]
    if question_type
      @question = Question.includes(:question_template, :answers).where(question_template: { question_type: }).sample
    else
      @question = Question.includes(:question_template, :answers).all.sample
    end

    @stimulus_controller = @question.question_template.answer_type.gsub('_', '-')

    render @question.question_template.answer_type
  end
end



