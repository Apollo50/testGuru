class CreateTableBadgesUsersPassedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users_passed_tests do |t|
      t.references :badge
      t.references :users_passed_test
    end
  end
end
