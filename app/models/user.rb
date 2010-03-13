class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :rememberable, :validatable, :registerable
end
