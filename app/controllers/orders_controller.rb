class OrdersController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        orders = Order.all
        render json: orders, include: [order_items: {except: [:created_at, :updated_at, :order_id, :product_id]}]
    end 
 
    def create
        @order = Order.create(order_params)
        render json: @order
    end
 
    def update
        order = Order.find(params[:id])
        if order.update(order_params)
            render json: order
        else 
            render json: { message: 'failed to create order' }, status: :unprocessable_entity
        end 
    end 
 
    def destroy
    end
 
    private

    def order_params
        params.require(:order).permit(:user_id, :total, :complete, :order_items => [:order_id, :price])
    end

end
