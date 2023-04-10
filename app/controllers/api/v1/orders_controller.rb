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
      
        ActiveRecord::Base.transaction do
          if @order.save
            @order.order_details.create(order_detail_params)
            @comment = @order.comments.create(comment_params)
            @comment.commentable = @order
            render json: @order, status: :created
          else
            render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
          end
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
        params.require(:order).permit(
            :address,
            :total_bill,
            :user_id,
            order_details_attributes: [:product_id, :quantity, :discount],
            comments_attributes: [:content, :user_id]
        )
    end
    
    def order_detail_params
        params.require(:order).require(:order_details_attributes).map { |order_details| order_details.permit(:product_id, :quantity, :discount) }
    end
    
    def comment_params
        params.require(:order).require(:comment_attributes).permit(:content, :user_id)
    end

    def set_order
        @order = Order.find_by(id: params[:id])
        render json: "Order not found", status: :not_found if @order.nil?
    end
end

  