class AddDefValuesForAttributes < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 0)
    change_column_default(:answers, :correct, from: false, to: true)
  end
end
