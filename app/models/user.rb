class User < ApplicationRecord
    
    has_secure_password

    has_many :posts
    

    validates :user_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :bio, length: { maximum: 200 }
	$x = SecureRandom.hex(5)
	def sendMail
   		
   		mail = Mail.new do
     		from 'uberswaggerauthenication@gmail.swag'
     		to self[:email]
     		subject $x
     		body 'swagger'
   		end
  
   		mail.delivery_method :sendmail
   		mail.deliver
   		self.verification_code == $x ? (self.verication_code = "True") : (puts "Check your email!")
	end


end
