class User < ApplicationRecord
  has_many :author_tests, class_name: "Test"
  has_many :users_passed_tests
  has_many :tests, through: :users_passed_tests

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  has_secure_password

  def passage_test(test)
    users_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests(level)
    tests.where(level: level)
  end
end
