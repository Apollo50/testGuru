class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.feedback(@feedback).deliver_now
      redirect_to root_path, notice: 'Thanks for your feedback'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body, :user_id)
  end
end
