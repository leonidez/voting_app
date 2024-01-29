# typed: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :candidate

  after_create :update_election_results

  private

    def update_election_results
      if Vote.count % 10 == 0
        results = Candidate
          .joins(:votes)
          .select('candidates.id, candidates.name, count(votes.candidate_id) as total_votes')
          .group('votes.candidate_id')

        Rails.cache.write('election_results', results.to_json)
      end
    end
end
