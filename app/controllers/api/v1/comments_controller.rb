class Api::V1::CommentsController < ApplicationController
    before_action :set_product
    before_action :set_comment, only: [:show, :update, :destroy]

    def index
        @comments = Comment.all
        render json: @comments
    end
  
    def show
        render json: @comment
    end
  
    def create
      @comment = @product.comments.build(comment_params)
  
      if @comment.save
        render json: @comment, status: 201
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @comment.update(comment_params)
        render json: @comment, status: :ok
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if  @comment.destroy
        render json: nil, status: :no_content
      else
        render json: { errors: @comment.errors }, status: :unprocessable_entity
      end
    end

    private

        def set_product
            @product = Product.find(params[:product_id])
            render json: "Product not found", status: :not_found if @product.nil?
        end
    
        def set_comment
            @comment = @product.comments.find(params[:id])
            render json: "Comment not found", status: :not_found if @comment.nil?
        end
    
        def comment_params
            params.require(:comment).permit(:content, :user_id)
        end
end
