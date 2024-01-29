# typed: true

Rails.application.config.after_initialize do
  # make sure memcached is hydrated after server start
  # if we already have at last 10 votes

  if Vote.count >= 10
    results = Candidate
      .joins(:votes)
      .select('candidates.id, candidates.name, count(votes.candidate_id) as total_votes')
      .group('votes.candidate_id')

    Rails.cache.write('election_results', results.to_json)
  end
end
