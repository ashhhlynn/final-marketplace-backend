class SessionsController < ApplicationController
  
    def create
      @user = User.find_by(email: user_login_params[:email])
      if @user
        session[:user_id] = @user.id
        render json: @user
      else 
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete :user_id
      render json: { error: "Successfully logged out" }, status: :ok
    end
  
  private

    def user_login_params
        params.require(:user).permit(:email, :password)
    end

  end