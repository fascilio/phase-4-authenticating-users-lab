class SessionsController < ApplicationController
    def create
      user = User.new(username: params[:username])
  
      if user.save
        session[:user_id] = user.id
        render json: user
      else
        render json: { error: 'Invalid username' }, status: 401
      end
    end
  
    def destroy
      session[:user_id] = nil
      head :no_content
    end
  end
  