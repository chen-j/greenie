class Match < ApplicationRecord
    belongs_to :scorer
    has_many :match_events
end
