class OrdersController < ApplicationController
    def index
        @item = Item.find(params[:item_id])
        @address = OrdersAddress.new
    end

    def create
        @item = Item.find(params[:item_id])
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
        params.require(:orders_address).permit(:postal_code, :city, :address, :building, :phone, :shipment_street_id, :purchase).merge(user_id: current_user.id, item_id:@item.id, token: params[:token])
    end

    def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,  
      card: address_params[:token], 
      currency: 'jpy' 
    )
    end
end