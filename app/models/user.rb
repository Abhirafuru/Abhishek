####################skip bcoz of fb
# class MyValidator < ActiveModel::Validator

# 	def validate(record)
# 	age = Date.today.year - record.dob.year
# 	age -= 1 if Date.today < record.dob + age.years
# 		if age<18
# 		record.errors[:dob] << 'should be at least 18 Years old'
# 		end
# 	end
# end

# class GoodnessValidator < ActiveModel::Validator

# 	def validate(record)
# 	  em = record.email.split('@').last
# 		unless em == "mobiloitte.com"
# 		 record.errors[:email] << "email should contain @mobiloitte.com"
# 		end
# 	end
# end
###############ends here
require 'carrierwave/orm/activerecord'
class User < ActiveRecord::Base
	#attr_accessible :image_cache

	has_secure_password
	mount_uploader :image, AbhishekUploader

	############skip bcoz of fb 
	# validates :name, exclusion: { in: %w[abhishek,Abhishek] ,
 #                                       message: "%{value} is reserved." }
    
	# validates :email, :name, uniqueness: true
	# validates :name, length: { maximum: 20,
 #                                       too_long: "%{count} characters is the maximum allowed" }

 #    validates :name, format: { with: /\A[a-zA-Z]+\z/,
 #                                        message: "only allows letters" }


 #    #validates :password, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{8,})\z/i,
 #                                        #message: "Should Contains " }
	#  #validates_format_of :password, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	# validates :password, length: { minimum: 8 }
	# validates  :name,  presence: { case_sensitive: false }
	# validates  :dob, presence: true
	#validates_with MyValidator 
	#validates_with GoodnessValidator 
###############ends here

	#########facebook login
	def self.create_with_omniauth(auth)
        create! do |user|
    p "=======#{auth["provider"]}========#{auth["credentials"]["token"]}======================="
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    #user.password = "abhishek11"
    user.email = auth["info"]["email"]
    user.name = auth["info"]["name"]
    user.image = auth["info"]["image"]
      if auth["provider"].eql?("facebook") || auth["provider"].eql?("twitter")
      return user
       #user.email = auth["info"]["nickname"]
      else
     
      end
  end

  end
	##################fb ends here
	before_create { generate_token(:auth_token) } 

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end 
    while User.exists?(column => self[column])
  end
end


def send_password_reset(user)
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!(validate: false)
  UserMailer.send_password_reset(user).deliver_now
end


end

#{}"hey@mycorp.com".split("@").last