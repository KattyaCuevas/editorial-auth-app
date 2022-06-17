class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: user_params[:email].downcase)
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:error] = 'Invalid credentials'
      render 'new'
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end

