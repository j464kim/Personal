class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # attr_accessor :name, :email

  has_many :pins
  has_many :posts
  has_many :comments
end


class AddUserIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :user_id, :integer
    add_index :pins, :user_id
  end
end
