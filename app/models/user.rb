class User < ActiveRecord::Base
	attr_accessor 	:password, :password_confirmation
	after_save 		:save_pass
	before_save 	:set_pass

	has_one :pass
	has_many :photos, dependent: :destroy

	validates :first_name, 
	:presence=>{:message=>"Please enter your first name"}

	validates :last_name, 
	:presence=>{:message=>"Please enter your last name"}

	validates 	:username, 
	:presence=>{:message=>"Please enter your username"},
	:uniqueness=>{:message=>"Oops, Username already taken"}

	validates 	:email, 
	:presence=>{:message=>"Please enter email"},
	:format=>{ with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ },
	:uniqueness=>{:message=>"Oops, Email Address alreadsy in use"}

	validates	:password,
	:presence=>true,
	:confirmation =>true

	validates 	:password_confirmation, :presence=>true


	def set_pass
		@pass = Pass.new :email => self.email,
		:password => self.password,
		:password_confirmation => self.password_confirmation
	end

	def valid_password?(password)
		pass = Pass.find_by :user => self
		if pass.valid_password?(password)
			return true
		else
			return false				
		end
	end

	def fullname
		"#{first_name} #{last_name}"
	end

	private
		def save_pass
			@pass.user = self
			@pass.save
		end
end