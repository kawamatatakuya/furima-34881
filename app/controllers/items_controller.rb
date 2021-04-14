class ItemsController < ApplicationController
    before_action :authenticate_user!,  except: [:show, :index]
    def index
      @items = Item.all
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
      # @item = Item.all
      # @item = Item.find(item_params)
    end

    def edit
    end

    private

    def item_params
        params.require(:item).permit(:product, :product_description, :category_id, :status_id, :delivery_fee_id, :shipment_street_id, :shipment_day_id,  :price, :image).merge(user_id: current_user.id)
    end
end