# typed: true

class Candidate < ApplicationRecord
  validates :name, uniqueness: true

  has_many :votes

  before_create :enforce_candidate_limit

  private
    def enforce_candidate_limit
      if Candidate.count == 10
        throw :abort
      end
    end
end
