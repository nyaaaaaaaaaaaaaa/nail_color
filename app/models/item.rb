class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 以下を追記
  #itemsテーブルから中間テーブルに対する関連付け
  #has_many :item_tag_relations, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け, through: :item_tag_relations, dependent: :destroy
  belongs_to :tag

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
