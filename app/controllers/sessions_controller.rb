class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    existing_user = User.find_by(user_params)
    @user = User.new(user_params)

    if existing_user
      cookies.encrypted[:user_id] = existing_user.id
      redirect_to votes_new_url
    elsif @user.save
      cookies.encrypted[:user_id] = @user.id
      redirect_to votes_new_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :zip_code)
    end
end
