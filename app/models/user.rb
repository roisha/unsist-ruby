class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  	validates :password, :presence => true,
  					   :confirmation => true, 
  					   :length => {:within => 6..40},
                       :on => :create,
                       :if => :password, 
                       :format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }
 	has_many :pins
end
