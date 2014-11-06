class UsersController < ApplicationController
 
def new
@user = User.new
end
 
def create
@user = User.new(user_params)
if @user.save
render text: "Thank you! You will receive an SMS shortly with verification instructions."
else
render :new
end
end

private
def user_params
	    params.require(:user).permit(:email, :name, :phone)
 end
end