class ItemsController < ApplicationController
    before_action :authenticate_user!,  except: [:show, :index]
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    before_action :move_to_top, only: [:edit, :update, :destroy]

    def index
      @items = Item.all
      @purchase = Purchase.all
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
      @purchase = Purchase.find(params[:id])
    end

    def edit
    end

    def update
      if @item.update(item_params)
         redirect_to item_path
      else
        render :edit
      end
    end

    def destroy
      @item.destroy
      redirect_to root_path
    end

    private

    def item_params
        params.require(:item).permit(:product, :product_description, :category_id, :status_id, :delivery_fee_id, :shipment_street_id, :shipment_day_id,  :price, :image).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def move_to_top
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    end
end