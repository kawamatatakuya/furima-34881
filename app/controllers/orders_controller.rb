class OrdersController < ApplicationController
    before_action :authenticate_user!,  only: [:index, :create]
    before_action :set_item
    before_action :move_to_top, only: [:index, :create]
    
    def index
      @ordersaddress = OrdersAddress.new
    end

    def create
      @ordersaddress = OrdersAddress.new(address_params)

      if @ordersaddress.valid?
      pay_item
      @ordersaddress.save
      return redirect_to root_path
      else
      render 'index'
      end
    end

    private
    def address_params
      params.require(:orders_address).permit(:postal_code, :city, :address, :building, :phone, :shipment_street_id).merge(user_id: current_user.id, item_id:@item.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:  @item.price,  
        card: address_params[:token], 
        currency: 'jpy' 
      )
    end

    def move_to_top
      if current_user.id == @item.user_id || @item.purchase.present?
        redirect_to root_path
      end
    end

    def set_item
        @item = Item.find(params[:item_id])
    end
end