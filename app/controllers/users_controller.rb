class UsersController < ApplicationController

    
    def index
        users = User.all
        render json: users
    end

  

    def new
        user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          
            render json: @user
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:name, :email, :address, :password, :password_confirmation, :id)
    end

end
