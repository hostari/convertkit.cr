class ConvertKit::Tags
  def self.unsubscribe(subscriber_id : Int64 | Int32, tag_id : Int64 | Int32)
    response = ConvertKit.client.delete("/v3/subscribers/#{subscriber_id}/tags/#{tag_id}")

    raise Exception.new(response.body) if response.status_code >= 400

    ConvertKit::Tags::Tag.from_json(response.body)
  end

  def self.unsubscribe(tag_id : Int64 | Int32, email : String)
    response = ConvertKit.client.post("/v3/tags/#{tag_id}/unsubscribe", form: email.to_s)

    raise Exception.new(response.body) if response.status_code >= 400

    ConvertKit::Tags::Tag.from_json(response.body)
  end
end
