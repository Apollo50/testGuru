class Badge < ApplicationRecord
  has_and_belongs_to_many :users, depend: :destroy
  has_and_belongs_to_many :users_passed_tests, depend: :destroy
end
