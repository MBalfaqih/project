
class Api::V1::UsersController < ApplicationController

    before_action :set_user , only: [ :show , :update , :destroy]

    def index
        users = User.order(:id)
        json_response(users)
    end

    def show
        json_response(@user)
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            json_response(@user)
        else
            json_response(@user , status = :unprocessable_entity) 
        end
    end

    def update
        
        if @user.update_attributes(user_params)
            json_response(@user)
           # head :no_content
        else
            json_response(@user , status = :unprocessable_entity) 
        end
    end

    def destroy

        if @user.destroy
            json_response(@user)
            # head :no_content Will return no value
            head :no_content
        else
            json_response(@user , status = :Unprocessable_Entity) 
        end
    end


    private

    def set_user
        @user =  User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name , :password , :age)
    end 


end
