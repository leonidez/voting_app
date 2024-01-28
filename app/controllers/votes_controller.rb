# typed: true

class VotesController < ApplicationController
  def index
  end

  def new
    @user = User.find_by(id: cookies.encrypted[:user_id])

    if !@user
      redirect_to root_url
      flash[:notice] = 'Please log in before continuing.'
    elsif @user.has_voted?
      redirect_to votes_url
      flash[:notice] = 'You have already voted.'
    else
      @candidate_fields = Candidate.new
      @candidates = Candidate.all
      @expiration = Time.now + 5.minutes
    end
  end
end
