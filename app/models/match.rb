class Match < ApplicationRecord
    belongs_to :scorer
    has_many :match_events
    def to_param
        "#{id}-#{teamAName}-vs-#{teamBName}-#{matchdate.strftime("%A %e %B %Y")}".parameterize
    end
end
