class Api::V1::CommentsController < ApplicationController
  before_action :set_product, only: [:product_comment]

  def product_comment
    @comment = @product.comments.new(comment_params)
    @comment.commentable = @product
    if @comment.save
      render json: @comment, status: 201
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
      render json: "Product not found", status: :not_found if @product.nil?
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
