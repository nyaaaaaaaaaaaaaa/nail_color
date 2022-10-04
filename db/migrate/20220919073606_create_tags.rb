class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

      t.timestamps

      ## 追加
      t.string :name, null: false
    end
  end
end
