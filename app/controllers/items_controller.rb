class ItemsController < ApplicationController
    before_action :authenticate_user!,  except: [:show, :index]
    before_action :move_to_login, only: [:edit, :update]
    before_action :set_tweet, only: [:show, :edit, :update]

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
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
         redirect_to item_path
      else
        render :edit
      end
  end

    private

    def item_params
        params.require(:item).permit(:product, :product_description, :category_id, :status_id, :delivery_fee_id, :shipment_street_id, :shipment_day_id,  :price, :image).merge(user_id: current_user.id)
    end

    def move_to_login
      @item = Item.find(params[:id])
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    end

    def set_tweet
      @item = Item.find(params[:id])
    end
end