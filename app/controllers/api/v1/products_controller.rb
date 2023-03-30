class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    def index
        @products = Product.all
        render json: @products, each_serializer: ProductSerializer, status: :ok
    end

    def show
        render json: @product, serializer: ProductSerializer, status: :ok
    end

  def create
    @product = Product.new(product_params)

    if @product.save
        render json: @product, status: 201
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
        render json: @product, status: :ok
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if  @product.destroy
        render json: nil, status: :no_content
      else
        render json: { errors: @product.errors }, status: :unprocessable_entity
      end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :category_id)
    end

    def set_product
        @product = Product.find_by(id: params[:id])
        render json: "Product not found", status: :not_found if @product.nil?
    end
end
