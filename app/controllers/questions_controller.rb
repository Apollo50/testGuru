class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to question
    else
      render plain: 'Error'
   end
  end

  def destroy
    @question.destroy
    render plain: "Question was deleted!"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
