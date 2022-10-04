class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps

      ## 追加
      t.integer :tag_id, null: false
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.boolean :status, default: false, null: false
    end
  end
end
