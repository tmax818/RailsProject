class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session]
      user = User.find_by(email: params[:session][:email])
        debugger
    else
      user = User.create_by_google(auth)
    end
    if user && user.authenticate(user.password)
      log_in user
      flash[:success] = "Welcome Back #{user.name.capitalize}"
      debugger
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination."
      render :new
    end
  end

  def destroy
    log_out
    flash[:danger] = "Goodbye, thank you for using Library Tracker!"
    redirect_to root_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end
