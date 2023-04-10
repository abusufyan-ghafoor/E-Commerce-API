class Api::V1::CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]
    def index
      @categories = Category.all
      render json: @categories, each_serializer: CategorySerializer, status: :ok
    end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: 201
    else
      render_errors(@category)
    end
  end

  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render_errors(@category)
    end
  end

  def destroy
    if  @category.destroy
      render json: nil, status: :no_content
    else
      render_errors(@category)
    end
  end

  private
    def category_params
      params.require(:category).permit(:name, :description)
    end

    def set_category
      @category = Category.find_by(id: params[:id])
      render json: "Category not found", status: :not_found if @category.nil?
    end
end
