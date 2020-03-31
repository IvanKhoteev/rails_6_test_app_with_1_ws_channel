class TestChannel < ApplicationCable::Channel
  def subscribed
    stream_from "test_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    payload = JSON.parse(data['payload']).to_json
    ActionCable.server.broadcast('test_channel', payload)
  end
end
