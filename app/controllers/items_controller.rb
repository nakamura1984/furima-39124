class ItemsController < ApplicationController

  def index
  end

 # def new
  #  @item = Item.new
  #end

  #def create
   # @item = Item.new(item_params)
    
    #if @item.save
     # redirect_to root_path
    #else
     # render :new
    #end
  #end

  #def _params
   # params.require(:item).permit(:nickname, :email, :encrypted_password, :password_confirmation, :double_byte_first_name, :double_byte_last_name, :double_byte_first_name_kana, :double_byte_last_name_kana, :date_of_birth).merge(user_id: current_user.id)
  #end
end
