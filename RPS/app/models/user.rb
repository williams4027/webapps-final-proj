class User < ActiveRecord::Base
  attr_accessor :user_name
  attr_accessor :password
  attr_accessor :wins
  attr_accessor :losses
  attr_accessor :ties
   
end
