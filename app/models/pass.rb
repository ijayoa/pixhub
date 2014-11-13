class Pass < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	     
	belongs_to	:user
	validates	:user, 
				:presence=>{:message=>"No user specified"}

	validates	:email,
				:presence => {:message=>"No email entered"}

	validates	:password,
				:presence=>true,
				:confirmation =>true

	validates 	:password_confirmation, :presence=>true
end
