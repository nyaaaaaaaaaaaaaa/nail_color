class Public::TagsController < ApplicationController

  def index
    if params[:tag_id]
      @items = []
      params[:tag_id].each do |key, value|
        @items += Tag.find_by(name: key).items if value == "1"
      end
      @items.uniq!
    end
    #@tag = Tag.find(params[:tag_id])
    #@items = @tag.items
  end

end
