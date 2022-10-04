class Tag < ApplicationRecord
  # 以下を追記
  #Tagsテーブルから中間テーブルに対する関連付け
  #has_many :item_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け, through: :item_tag_relations
  has_many :items, dependent: :destroy
end
