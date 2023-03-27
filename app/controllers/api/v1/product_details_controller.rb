class Api::V1::ProductDetailsController < ApplicationController
    before_action :set_product_detail, only: [:show, :update, :destroy]
    def index
        @product_details = ProductDetail.all
        render json: @product_details, each_serializer: ProductDetailSerializer, status: :ok
    end

    def show
        render json: @product_detail, serialize: ProductDetailSerializer, status: :ok
    end

  def create
    @product_detail = ProductDetail.new(product_detail_params)

    if @product_detail.save
        render json: @product_detail, status: 201
    else
        render_errors(@product_detail)
    end
  end

  def update
    if @product_detail.update(product_detail_params)
        render json: @product_detail, status: :ok
    else
        render_errors(@product_detail)
    end
  end

  def destroy
    if  @product_detail.destroy
        render json: nil, status: :no_content
      else
        render_errors(@product_detail)
      end
  end

  private
    def product_detail_params
      params.require(:product_detail).permit(:size, :stock, :product_id)
    end

    def set_product_detail
        @product_detail = ProductDetail.find_by(id: params[:id])
        render json: "Product Detail not found", status: :not_found if @product_detail.nil?
    end
end
