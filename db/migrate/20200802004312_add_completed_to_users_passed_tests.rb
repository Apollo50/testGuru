class AddCompletedToUsersPassedTests < ActiveRecord::Migration[6.0]
  def change
    add_column :users_passed_tests, :completed, :boolean, default: false
  end
end
