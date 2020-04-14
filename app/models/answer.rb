class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_limit, on: :create

  scope :correct_answers, -> { where(correct: true) }

  def validate_answers_limit
    errors.add(:answers_limit, "It's possible to create 4 answers only.") if question.answers.count >= 4
  end
end
