class ConvertKit::Subscriber
  def self.unscubscribe(email : String)
    io = IO::Memory.new
    builder = ParamsBuilder.new(io)

    {% for x in %w(email) %}
      builder.add({{x}}, {{x.id}}) unless {{x.id}}.nil?
    {% end %}

    response = ConvertKit.client.put("/v3/unsubscribe", form: io.to_s)

    if response.status_code == 200
      ConvertKit::Subscriber.from_json(response.body, root: "subscriber")
    else
      raise Exception.new(response.body)
    end
  end
end
