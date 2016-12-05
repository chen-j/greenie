# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MatchesChannel < ApplicationCable::Channel

  def follow(data)
    stop_all_streams
    stream_from "match_#{data['match_id']}"
  end

  def unfollow
    stop_all_streams
  end

end
