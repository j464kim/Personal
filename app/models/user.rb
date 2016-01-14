class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Password validation
  # validates :password, :presence => true,
  #                    :on => :create,
  #                    :format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }
end
