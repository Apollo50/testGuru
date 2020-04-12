class AddAuthorForTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true
  end
end
