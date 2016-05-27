class UsersController < ApplicationController
  skip_before_action :authenticate
  def login
    @user=User.new
  end

  def createsession
      user =User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
          newsession(user)
          redirect_to root_path
      else
        @error = 'Combination of email and password does not match'
      end

  end


end
