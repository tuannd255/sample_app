class UsersController < ApplicationController

	def show
    	@user = User.find(params[:id])
  	end
  	
  	def new
  		@user = User.new
  	end

  	def create
  		params[:user][:sex] = params[:user][:sex].to_i
	    @user = User.new(user_params)
	    if @user.save
	      flash[:success] = "Chao mung " + @user.name + " den voi trang web cua toi! #{@user.sex}"
	      redirect_to @user
	    else
	      render 'new'
    	end
  	end
  	private

	    def user_params
	      params.require(:user).permit(:name, :email, :sex, :password,
	                                   :password_confirmation)
	    end
end
