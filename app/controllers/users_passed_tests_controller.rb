class UsersPassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_passage_test, only: %i[show update result gist]

  def show
  end

  def update
    @passage_test.accept!(params[:answer_ids])

    if @passage_test.completed?
      TestsMailer.completed_test(@passage_test).deliver_now
      redirect_to result_users_passed_test_path(@passage_test)
    else
      render :show
    end
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@passage_test.current_question).call

    flash_options = if result.success?
                      { notice: t('.success') }
                    else
                      { alert: t('.failure') }
                    end
    redirect_to @passage_test, flash_options
  end

  private

  def set_passage_test
    @passage_test = UsersPassedTest.find(params[:id])
  end

end
