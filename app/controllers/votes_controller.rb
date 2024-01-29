# typed: true

class VotesController < ApplicationController
  def index
    @candidates = Candidate.all
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
      @vote_fields = Vote.new
      @candidate_fields = Candidate.new
      @candidates = Candidate.all
      @expiration = Time.now + 5.minutes
    end
  end

  def create
    user = User.find_by(id: cookies.encrypted[:user_id])
    candidate = Candidate.find_by(id: vote_params[:candidate_id])

    if user
      Vote.create!(user: user, candidate: candidate)
      redirect_to votes_url
      flash[:notice] = 'Thank you for voting!'
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:candidate_id)
    end
end
