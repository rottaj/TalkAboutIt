class User < ApplicationRecord
    
    has_secure_password

    after_create :assign_verification_code

    has_many :posts
    

    validates :user_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :bio, length: { maximum: 200 }


	def sendMail
   		mail = Mail.new do
     		from 'uberswaggerauthenication@gmail.swag'
     		to $user.email
     		subject $user.verification_code
     		body 'swagger'
   		end
    
   		mail.delivery_method :sendmail
   		mail.deliver
  end

  def assign_verification_code
    self.verification_code = SecureRandom.hex(6)
  end


end
