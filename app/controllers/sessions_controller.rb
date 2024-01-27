class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_exists = User.find_by(user_params)

    if user_exists
      puts 'exists'
    else
      User.create!(user_params)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :zip_code)
  end
end
