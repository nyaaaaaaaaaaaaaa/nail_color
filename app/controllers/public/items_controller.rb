class Public::ItemsController < ApplicationController

  def new
    @item = Item.new
    @customer = current_customer
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @customer = @item.customer#.page(params[:page])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.tag_id = params[:item][:tag_id].first
    @item.save
    redirect_to item_path(@item)
  end

  def update
    @items = Item.all
    @item = Item.find(params[:id])
    @item.tag_id = params[:item][:tag_id].first
    if @item.update(item_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to item_path(@item)
    else
      @customer = current_customer
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :status, :tag_id).merge(customer_id: current_customer.id)
  end

  def article_params
    params.require(:article).permit(:body, :tag_id)
  end

end
