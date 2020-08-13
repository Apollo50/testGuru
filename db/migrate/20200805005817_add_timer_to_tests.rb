class AddTimerToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer, :integer
  end
end
