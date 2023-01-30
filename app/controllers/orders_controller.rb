class OrdersController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        all_orders = Order.all
        orders = all_orders.select{ |order| order.complete == true }  
        render json: orders, include: [order_items: {except: [:created_at, :updated_at, :order_id, :product_id]}]
    end 
 
    def create
        @order = Order.create(order_params)
        render json: @order
    end
 
    def update
        order = Order.find(params[:id])
        order.update(order_params)
    end 
 
    def destroy
    end
 
    private

    def order_params
        params.require(:order).permit(:user_id, :total, :complete, :order_items => [:order_id, :price])
    end

end
