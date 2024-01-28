# typed: true

class CandidatesController < ApplicationController
  def create
    user = User.find_by(id: cookies.encrypted[:user_id])

    if user
      user.transaction do
        candidate = Candidate.create!(candidate_params)
        vote = Vote.create!(user: user, candidate: candidate)

        redirect_to votes_url
        flash[:notice] = 'Thanks for voting!'
      rescue ActiveRecord::RecordInvalid
        @candidate_fields = candidate
        @candidates = Candidate.all
        render 'votes/new', status: :unprocessable_entity
      end
    end

  end

  private

    def candidate_params
      params.require(:candidate).permit(:name)
    end
end
