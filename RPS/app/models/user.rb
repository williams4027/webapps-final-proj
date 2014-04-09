class User < ActiveRecord::Base
   #self.primary_key = :user_name
   belongs_to :games
end
