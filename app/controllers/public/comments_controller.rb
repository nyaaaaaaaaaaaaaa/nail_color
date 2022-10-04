class Public::CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new
    @item = Item.find(params[:item_id])
    @comment.customer_id = current_customer.id
    @comment.item_id = @item.id
    @comment.comment = comment_params[:comment]
    @comment.save!
    redirect_to item_path(@item)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update!(comment_params)
      redirect_to customers_commentsindex_path
    else
      @customer = current_customer
      render :edit
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to customers_commentsindex_path
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :comment, :item_id)
  end
end
