class SessionController < ApplicationController
    skip_before_action :check_auth, only: :create
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else 
            render json: {errors: "Invalid password"}, status: 401
        end
    end
    
    def delete
        session.destroy

        head :no_content
    end
end
