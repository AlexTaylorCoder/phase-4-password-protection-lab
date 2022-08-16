class UsersController < ApplicationController
    def create
        render json: User.create!(permitted)
    end
    def show
        render json: User.find(params[:id])
    end

    private 

    def permitted
        params.permit(:username,:password,:id)
    end

end
