class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login; end

  def welcome; end

  def destroy
    session.delete(:user_id)
    redirect_to '/welcome'
  end
end
