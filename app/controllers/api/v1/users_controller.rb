class  Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer, status: :ok
    end
  
    def show
        render json: @user, serializer: UserSerializer, status: :ok
    end
  
    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: 201
        else
            render json: { errors: @user.errors }, status: :unprocessable_entity
        end
    end
  
    def update
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: { errors: @user.errors }, status: :unprocessable_entity
        end
    end
  
    def destroy
        if @user.destroy
            render json: nil, status: :no_content
        else
            render json: { errors: @user.errors }, status: :unprocessable_entity
        end
    end
  
    private
        def set_user
            @user = User.find_by(id: params[:id])
            render json: "User not found", status: :not_found if @user.nil?
        end
  
        def user_params
            params.require(:user).permit(:name, :email, :address, :role)
        end
  end
  