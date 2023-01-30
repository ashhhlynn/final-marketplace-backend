class ProductsController < ApplicationController

  skip_before_action :authorized, only: [:index]

    def index
        products = Product.all
        render json: products
    end

    def create
        @product = Product.create(product_params)
        if @product.valid?
        render json: @product, status: :created
        else 
        render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def product_params
      params.require(:product).permit(:title, :price, :image_url, :description)
  end

end
