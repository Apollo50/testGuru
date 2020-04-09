class CorrectDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, from: true, to: false)
    change_column_null(:answers, :body, false)
  end
end
