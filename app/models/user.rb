class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :author_tests, class_name: "Test", foreign_key: :user_id
  has_many :users_passed_tests, dependent: :nullify
  has_many :tests, through: :users_passed_tests
  has_many :gists, dependent: :destroy
  has_many :feedbacks
  has_and_belongs_to_many :badges, depend: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  def passage_test(test)
    users_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end
end
