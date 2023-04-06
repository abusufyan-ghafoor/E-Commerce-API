class Api::V1::OrderDetailsController < ApplicationController
    before_action :set_order_details, only: [:show, :update, :destroy]
    
    def index
        @order_details = OrderDetail.all
        render json: @order_details
    end

    def show
        render json: @order_detail, status: :ok
    end

    def create
        @order_detail = OrderDetail.new(order_detail_params)

        if @order_detail.save
            render json: @order_detail, status: 201
        else
            render json: { errors: @order_detail.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @order_detail.update(order_detail_params)
            render json: @order_detail, status: :ok
        else
            render json: { errors: @order_detail.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        if  @order_detail.destroy
            render json: nil, status: :no_content
        else
            render json: { errors: @order_detail.errors }, status: :unprocessable_entity
        end
    end

    private
  
        def order_detail_params
            params.require(:order_detail).permit(:quantity, :discount, :product_id, :order_id)
        end

        def set_order_details
            @order_detail = OrderDetail.find_by(id: params[:id])
            render json: "order detail not found", status: :not_found if @order_detail.nil?
        end
end
