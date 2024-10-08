class Api::V1::UsersController < ApplicationController
  def sign_in
    @user = User.authenticate_by(params.permit(:email_address, :password))

    if @user
      render json: { access_token: @user.generate_access_token }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
