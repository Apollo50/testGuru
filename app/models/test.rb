class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions, dependent: :destroy
  has_many :users_passed_tests, dependent: :nullify
  has_many :users, through: :users_passed_tests

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :test_by_category, ->(category) { joins(:category).where("categories.title = ?", category) }
  scope :test_by_level, ->(level) {where("level = ?", level)}

  def self.tests_names_by_category(category)
    test_by_category(category).order(title: :desc).pluck(:title)
  end

  def has_timer?
    !timer.nil?
  end
end
