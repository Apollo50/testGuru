class User < ApplicationRecord
  has_many :author_tests, class_name: "Test"
  has_many :users_passed_tests
  has_many :tests, through: :users_passed_tests

  validates :name, presence: true

  def passage_test(test)
    users_passed_tests.order(:id, :desc).find_by(test_id: test.id)
  end

  def passed_tests(level)
    tests.where(level: level)
  end
end
