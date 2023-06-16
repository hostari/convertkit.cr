class ConvertKit::Subscriber
  def self.tags(subscriber_id : Int64 | Int32)
    response = ConvertKit.client.get("/v3/subscribers/#{subscriber_id}/tags")

    if response.status_code == 200
      ConvertKit::Tags.from_json(response.body)
    else
      raise Exception.new(response.body)
    end
  end
end
