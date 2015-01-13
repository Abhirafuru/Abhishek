class PasswordResetsController < ApplicationController

	def create
		Rails.logger.info"++++++++++++++#{params.inspect}"
		user = User.find_by_email(params[:email])
		user.send_password_reset(user) if user

		redirect_to root_url, :notice => "Email sent with password reset instructions."
	end

	# def edit
	# 	#@user = User.find_by_password_reset_token!(params[:id])
	# 	@user = User.find_by_id(params[:id])
	# end
	def edit  
        @user = User.find_by_password_reset_token!(params[:id])  
    end  

	# def update
	# 	# @user = User.find_by_password_reset_token!(params[:id])
	# 	# if @user.password_reset_sent_at < 2.hours.ago
	# 	# redirect_to new_password_reset_path, :alert => "Password &crarr; 
	# 	# reset has expired."
	# 	# elsif @user.update_attributes(params[:user])
	# 	# redirect_to root_url, :notice => "Password has been reset."
	# 	# else
	# 	# render :edit
	# 	# end
 #    @user = User.find_by_id(params[:id])

 #     if @user.update_attributes(users_params)
 #       redirect_to user_path, notice: 'Profile has been successfully updated'
 #     end
 # end
	
# private
# 	def users_params
# 	  params.require(:user).permit( :password)
# 	end
    def update  
        @user = User.find_by_password_reset_token!(params[:id])  
        if  @user.password_reset_sent_at < 48.hours.ago  
            redirect_to new_password_reset_path, :alert => "Password ↵   
            reset has expired."  
        elsif @user.update_attributes(users_params)  
            redirect_to root_url, :notice => "Password has been reset."  
        else  
            render :edit  
        end  
    end 
    private
 	def users_params
 	    params.require(:user).permit( :password)
 	end 
end





