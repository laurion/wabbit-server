module Api
  module V1
    class UsersController < ApplicationController
      # respond_to :json
      
       def index
        render json: User.all
      end
      
      # def show
      #   respond_with User.find(params[:id])
      # end
      
      # def create
      #   respond_with User.create(params[:user])
      # end
       def create
        @user = User.new(params[:user])
        p params
        if @user.save
          render json: @user
        else
          render json: { errors: @user.errors.full_messages },
                 status: :bad_request
        end
      end
      
      # def update
      #   respond_with User.update(params[:id], params[:users])
      # end
      
      # def destroy
      #   respond_with User.destroy(params[:id])
      # end
    end
  end
end