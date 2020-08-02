class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url, null: false
      t.string :rule_name, null: false

      t.timestamps
    end
  end
end
