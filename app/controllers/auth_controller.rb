class AuthController < ApplicationController

  def register
    @user = User.new(register_params)
    if @user.save
      head :created
    else
      head :bad_request
    end
  end

  def login
    credentials = login_params
    user = User.find_by username: credentials[:loginUsername]
    if user && user.authenticate(credentials[:loginPassword])
      render json: { token: user.token, username: user.username, id: user.id}
    else
      head :bad_request
    end
  end


  private

  def login_params
    params.require(:credentials).permit(:loginUsername, :loginPassword)
  end

  def register_params
    params.require(:credentials).permit(:username, :password, :password_confirmation)
  end
end

