class SessionsController < ApplicationController
 def new
  p "----------------#{current_user.inspect}--------------"
   if current_user!=nil
      redirect_to user_path(current_user.id) 
   end
  end
#########fb
 def create
   p "======================#{request.env["omniauth.auth"].inspect}======================================="
   user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id  
      redirect_to user_path(user)
        elsif 
          auth = request.env["omniauth.auth"]
          session[:fb_token] = auth["credentials"]["token"] if auth['provider'] == 'facebook'
          p "=====#{auth.inspect}========"
          user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
          session[:user_id] = user.id
          redirect_to user_path(user), :notice => "Signed in!"
           else
            flash[:notice] = "Invalid Username or Password"
            render "new"
         end
      end 
###########ends
  def destroy
   #reset_session
    if session[:fb_token].present? 
      redirect_to "https://www.facebook.com/logout.php?next=#{"http://localhost:3000"}&access_token=#{session[:fb_token]}" , :notice => "Logged out from fb!"
      session.clear
    else
      p "1111111111111111111111111111111111111111111"
     
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out!"
    end
     
  end
end
 