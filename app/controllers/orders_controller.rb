class OrdersController < ApplicationController
    def index
        @item = Item.find(params[:item_id])
        @address = OrdersAddress.new
    end

    def create
        @item = Item.find(params[:item_id])
        @address = OrdersAddress.new(address_params)
        if @address.save
          redirect_to root_path
        else
          render :index
        end
    end

    private
    def address_params
        params.require(:orders_address).permit(:postal_code, :city, :address, :building, :phone, :shipment_street_id, :purchase).merge(user_id: current_user.id, item_id:@item.id)
    end
end