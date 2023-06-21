class ConvertKit::Broadcast
  def self.stats(broadcast_id : Int64)
    response = ConvertKit.client.get("/v3/broadcasts/#{broadcast_id}/stats")

    if response.status_code == 200
      ConvertKit::Broadcast::Stats.from_json(response.body, root: "broadcast")
    else
      raise Exception.new(response.body)
    end
  end
end
