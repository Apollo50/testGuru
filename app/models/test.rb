class Test < ApplicationRecord
  belongs_to :category
  has_many :users_passed_tests
  has_many :users, through: :users_passed_tests
end
