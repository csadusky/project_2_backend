class AuthController < ApplicationController

  def register
    @user = User.new(login_params.merge(password_confirmation: nil))
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
      render json: { token: user.token }
    else
      head :bad_request
    end
  end


  private

  def login_params
    params.require(:credentials).permit(:loginUsername, :loginPassword)
  end
end
