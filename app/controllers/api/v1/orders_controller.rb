class Api::V1::OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]
    def index
        @orders = Order.all
        render json: @orders, each_serializer: OrderSerializer, status: :ok
    end

    def show
        render json: @order, serializer: OrderSerializer, status: :ok
    end

    def create
        @order = Order.new(order_params)

        if @order.save
            render json: @order, status: 201
        else
            render json: { errors: @order.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @order.update(order_params)
            render json: @order, status: :ok
        else
            render json: { errors: @order.errors }, status: :unprocessable_entity
        end
    end

    def destroy
        if  @order.destroy
            render json: nil, status: :no_content
        else
            render json: { errors: @order.errors }, status: :unprocessable_entity
        end
    end

    private
  
        def order_params
            params.require(:order).permit(:address, :total_bill, :user_id)
        end

        def set_order
            @order = Order.find_by(id: params[:id])
            render json: "Order not found", status: :not_found if @order.nil?
        end
end
