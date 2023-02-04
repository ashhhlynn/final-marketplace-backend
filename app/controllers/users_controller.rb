class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create, :index]

    def index
        users = User.all
        render json: users
    end
    
    def profile
        render json: {  user: current_user }, include: [orders: {include: :order_items}], status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token}, include: [orders: {include: :order_items}], 
            status: :created
        else
            render json: { message: 'failed to create user' }, status: :unprocessable_entity
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :email, :address, :password, :password_confirmation, :orders => [:total, :updated_at, :id, :complete])
    end

end
