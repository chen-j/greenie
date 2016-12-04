# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MatchesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "matches"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update
      ActionCable.server.broadcast "matches", message: "It works"
  end
end
