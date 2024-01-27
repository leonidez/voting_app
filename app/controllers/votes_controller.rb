class VotesController < ApplicationController
  def index
  end

  def new
    @user = User.find_by_id(cookies.encrypted[:user_id])

    if !@user
      redirect_to root_url
      flash[:notice] = 'Please log in before continuing.'
    # elsif @user.has_voted
    #   redirect_to votes_index_url
    end
  end
end
