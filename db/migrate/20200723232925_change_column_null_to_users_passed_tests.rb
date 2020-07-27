class ChangeColumnNullToUsersPassedTests < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users_passed_tests, :user_id, true
    change_column_null :users_passed_tests, :test_id, true
  end
end
