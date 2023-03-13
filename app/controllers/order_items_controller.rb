class OrderItemsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        order_items = OrderItem.all
        render json: order_items
    end

    def create
        if order_item = OrderItem.create(order_item_params)
            render json: order_item
        else 
            render json: { message: 'failed to add to cart' }, status: :unprocessable_entity
        end
    end

    def destroy
        order_item = OrderItem.find_by(product_id: params[:id])
        order_item.destroy
        head :no_content, status: :ok
    end

    private

    def order_item_params
        params.require(:order_item).permit(:order_id, :price, :product_id, :title, :seller)
    end

end
