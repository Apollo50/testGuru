class User < ApplicationRecord
  has_many :users_passed_tests
  has_many :tests, through: :users_passed_tests

  def passed_tests(level)
    tests.where(level: level)
  end
end
