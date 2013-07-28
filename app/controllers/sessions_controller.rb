class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to user_url(user.id), :notice => "You're logged in:)"
    else
      flash.now.alert = "Invalid email or password. Try again!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out."
  end

end
