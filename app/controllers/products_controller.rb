class ProductsController < ApplicationController

    def index
        products = Product.all
        render json: products
    end

    def create
        @product = Product.create(product_params)
        render json: @product
    end

      def destroy
        product = Product.find(params[:id])
        product.destroy
        head :no_content, status: :ok
      end

    private

    def product_params
        params.require(:product).permit(:title, :price, :image_url, :description)
    end


end
