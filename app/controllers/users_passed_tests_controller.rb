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
    service = GistQuestionService.new(@passage_test.current_question)
    result = service.call
    gist_url = result.html_url

    flash_options = if service.success?
                      create_gist(gist_url)
                      { notice: t('.success', gist_url: view_context.link_to('Show', gist_url)) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @passage_test, flash_options
  end

  private

  def create_gist(url)
    current_user.gists.create(question: @passage_test.current_question, gist_url: url )
  end

  def set_passage_test
    @passage_test = UsersPassedTest.find(params[:id])
  end
end
