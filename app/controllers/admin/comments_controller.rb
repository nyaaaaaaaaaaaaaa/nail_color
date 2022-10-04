class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.page(params[:page])
  end

  def edit
    @comment = Comment.find(params[:id])
    #@comment.customer_id = current_customer.id
    @customer = @comment.customer
  end

  def destroy
    @item = Item.find(params[:id])
    Comment.find(params[:id]).destroy
    redirect_to admin_item_path(@item)
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :comment, :item_id)
  end

end
