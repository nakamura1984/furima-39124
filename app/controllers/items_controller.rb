class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :shipping_cost_id, :area_of_origin_id, :estimated_sipping_date_id, :selling_price, :name, :detail).merge(user_id: current_user.id)
  end
end
