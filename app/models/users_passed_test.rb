class UsersPassedTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  has_and_belongs_to_many :badges, depend: :destroy

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  PASSING_RESULT = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def result
    100 * self.correct_questions/test.questions.count
  end

  def success?
    result >= PASSING_RESULT
  end

  def test_current_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def time_left
    (created_at + (test.timer*60)).to_i * 1000
  end

  def time_over?
    test.has_timer? ? (time_left < Time.now.to_i * 1000) : false
  end

  private

  def before_update_set_next_question
    self.current_question = next_question if current_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

