class UsersController < ApplicationController
 def new
	  @user = User.new
 end

 def create
		@user = User.new(users_params)
	   if @user.save
       flash[:notice] = "successfully SignedUp"
	     redirect_to root_path
	      else
		      render 'new'
	    end
 end

 def show
    @user = User.find(params[:id])
  end
 def index
    @users = User.all
  end

 def edit
    @user = User.find(params[:id])
 end

 def update
    @user = User.find(params[:id])
     if @user.update_attributes(users_params)
        flash[:notice] = "Profile updated"
        @user = User.find(params[:id])
          if @user.id == current_user.id
            redirect_to user_path, notice: 'Profile has been successfully updated'
              else 
                 redirect_to users_path, notice: 'Profile has been successfully updated'
         end
     end
 end

 def destroy
 	  @user = User.find(params[:id])
      if @user.destroy
      	 flash[:notice]= 'User has been deleted..'
      	redirect_to users_path
      end
  end

 private
	 def users_params
	    params.require(:user).permit(:name, :email, :password, :dob, :image, :image_cache)
	  end
end