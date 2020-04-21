class AddColumnsToUsersPassedTests < ActiveRecord::Migration[6.0]
  def change
    change_table :users_passed_tests do |t|
      t.references :current_question, foreign_key: { to_table: :questions  }
      t.integer :correct_questions, default: 0
     end
  end
end
