class Admin::TagsController < ApplicationController


  def index

    # 以下を追記
    if params[:tag]
      Tag.create(name: params[:tag])
    end
    #ここまで

  end

  #def index
  #  @tags = Tag.all
  #end

  #def create
  #  @tag = Tag.new(tag_params)
  #  @tags = Tag.all
  #  @tag.save
  #  redirect_to admin_tags_path
  #end

  #def edit
  #  @tag = Tag.find(params[:id])
  #end

  #def update
  #  @tag = Tag.find(params[:id])
  #  @tag.update(tag_params)
  #  redirect_to admin_tags_path
  #end


  #private

  #def tag_params
  #  params.require(:tag).permit(:name)
  #end

end
