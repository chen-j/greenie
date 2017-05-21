class MatchSerializer < ActiveModel::Serializer
  attributes :teamAName, :teamAScore, :teamBName, :teamBScore, :matchdate, :venue, :sport
end
