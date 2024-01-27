class VotesController < ApplicationController
  def index
  end

  def new
    @user = User.find_by_id(cookies.encrypted[:user_id])

    if !@user
      redirect_to root_url
    end
  end
end
