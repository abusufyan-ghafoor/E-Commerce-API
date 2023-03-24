class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    def index
        @products = Product.all
        render json: @products, status: :ok
    end

    def show
        render json: @product, status: :ok
    end

  def create
    @product = Product.new(product_params)

    if @product.save
        render json: @product, status: 201
    else
        render_errors(@product)
    end
  end

  def update
    if @product.update(product_params)
        render json: @product, status: :ok
    else
        render_errors(@product)
    end
  end

  def destroy
    if  @product.destroy
        render json: nil, status: :no_content
      else
        render_errors(@product)
      end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end

    def set_product
        @product = Product.find_by(id: params[:id])
        render json: "Product not found", status: :not_found if @product.nil?
    end
end
