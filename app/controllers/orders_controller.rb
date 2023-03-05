class OrdersController < ApplicationController


    def index
        orders = Order.all
        render json: orders
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
        params.require(:order).permit(:user_id, :total, :complete)
    end

end
