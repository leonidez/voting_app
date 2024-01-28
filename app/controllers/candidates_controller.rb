# typed: true

class CandidatesController < ApplicationController
  def create
    current_user = User.find_by(id: cookies.encrypted[:user_id])
    candidate = Candidate.create(candidate_params)
    vote = Vote.create(user: current_user, candidate: candidate)

    redirect_to votes_url
    flash[:notice] = 'Thanks for voting!'
  end

  private

    def candidate_params
      params.require(:candidate).permit(:name)
    end
end
