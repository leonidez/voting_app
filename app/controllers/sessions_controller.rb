# typed: true

class SessionsController < ApplicationController
  def new
    existing_user = User.find_by(id: cookies.encrypted[:user_id])

    if existing_user
      redirect_to votes_new_url
    else
      @user_fields = User.new
    end
  end

  def create
    existing_user = User.find_by(email: params[:email])
    draft_user = User.new(user_params)

    if existing_user
      cookies.encrypted[:user_id] = existing_user.id
      redirect_to votes_new_url
    elsif draft_user.save
      cookies.encrypted[:user_id] = draft_user.id
      redirect_to votes_new_url
    else
      @user_fields = draft_user
      render :new, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :zip_code)
    end
end
