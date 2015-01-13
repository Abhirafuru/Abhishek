#class UserMailer < ActionMailer::Base
class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # def send_password_reset(user)
  # 	@user= user
  # 	@token = @user.password_reset_token
  # 	mail(to: @user.email, subject: 'Welcome to My Awesome Site')

  # end
  def send_password_reset(user)  
    @user = user  
    mail :to => user.email, :subject => "Password Reset"  
  end  
end