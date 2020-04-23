class UsersPassedTestsController < ApplicationController
  before_action :set_passage_test, only: %i[show update result]

  def show
  end

  def update
    @passage_test.accept!(params[:answer_ids])

    if @passage_test.completed?
      redirect_to result_users_passed_test_path(@passage_test)
    else
      render :show
    end
  end

  def result
  end

  private

  def set_passage_test
    @passage_test = UsersPassedTest.find(params[:id])
  end

end
