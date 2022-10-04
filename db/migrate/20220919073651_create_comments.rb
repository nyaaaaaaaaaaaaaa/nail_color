class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps

      ## 追加
      t.integer :customer_id, null: false
      t.text :comment, null: false
      t.integer :item_id, null: false

    end
  end
end
