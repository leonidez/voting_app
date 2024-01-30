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
    existing_user = User.find_by(user_params)
    draft_user = User.new(user_params)
    expiration = 5.minutes.from_now

    existing_user.session_expires_at = expiration
    draft_user.session_expires_at = expiration

    if existing_user && existing_user.save
      create_user_cookie(existing_user.id, expiration)
      redirect_to votes_new_url
    elsif draft_user.save
      create_user_cookie(draft_user.id, expiration)
      redirect_to votes_new_url
    else
      @user_fields = draft_user
      render :new, status: :unprocessable_entity
    end
  end

  private
    def create_user_cookie(user_id, expiration)
      cookies.encrypted[:user_id] = {
        value: user_id,
        expires: expiration
      }
    end

    def user_params
      params.require(:user).permit(:email, :zip_code)
    end
end
