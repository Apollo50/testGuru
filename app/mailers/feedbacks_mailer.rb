class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback(feedback)
    @feedback = feedback

    mail to: @admin.email, subject: " 'TestGuru App': Feedback from #{@feedback.user.email}"
  end

  private

  def find_admin
    @admin = Admin.first
  end
end
