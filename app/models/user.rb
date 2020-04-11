class User < ApplicationRecord
  has_many :users_passed_tests
  has_many :tests, through: :users_passed_tests

  def passed_tests(level)
    UsersPassedTest.where( "user_id = ?", self.id ).joins(:test).where("tests.level = ?", level )
  end
end
