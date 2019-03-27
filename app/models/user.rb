class User < ApplicationRecord
    
    has_secure_password

    #after_create :assign_verification_code

    has_many :posts

    validates :user_name, presence: true
    #validates :email, presence: true, uniqueness: true
    #validates :bio, length: { maximum: 200 }


	def sendMail
   		mail = Mail.new do
     		from 'talkaboutit@verify.mail'
     		to $user.email
     		subject 'TalkAboutIt Email Verification'
     		body "Hi #{$user.user_name}! Here is your Verfication Code: #{$user.verification_code}. Thanks for joining TalkAboutIt!"
   		end
    
   		mail.delivery_method :sendmail
   		mail.deliver
  end

  def is_verified
    $user.verification_code == $input ? ($user.save && $user.verifcation_code = "True") : (puts "Check your email!")
  end

  def assign_verification_code
    self.verification_code = SecureRandom.hex(6)
  end


end
