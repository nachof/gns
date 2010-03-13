class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :rememberable, :validatable
end
