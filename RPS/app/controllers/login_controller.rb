class LoginController < ApplicationController
  def index
  end
  
  def parseUser
	comments_from_form = params[:username];
	puts "Read User: #{comments_from_form}";
  end
end
