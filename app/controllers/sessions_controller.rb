class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    existing_user = User.find_by(user_params)

    if existing_user
      redirect_to votes_new_url

    else
      User.create!(user_params)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :zip_code)
  end
end
