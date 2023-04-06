class BuysController < ApplicationController
  def index
    @buy_address = BuyAddress.new
  end

  def new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :municipality, :building_name, :telephone_number, :address, :area_of_origin_id).merge(user_id: current_user.id)
  end
end
