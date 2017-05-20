class Match < ApplicationRecord
    include Filterable

    belongs_to :scorer
    has_many :match_events

    scope :competition, -> (competition) { where competition: competition }
    scope :status, -> (status) { where matchStatus: status }
    scope :sport, -> (sport) { where sport: sport }
end
