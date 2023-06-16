class ConvertKit::Subscriber
  def self.update(id : Int64, first_name : String? = nil, email_address : String? = nil)
    io = IO::Memory.new
    builder = ParamsBuilder.new(io)

    {% for x in %w(first_name email_address) %}
      builder.add({{x}}, {{x.id}}) unless {{x.id}}.nil?
    {% end %}

    response = ConvertKit.client.put("/v3/subscribers/#{id}", form: io.to_s)

    if response.status_code == 200
      ConvertKit::Subscriber.from_json(response.body, root: "subscriber")
    else
      raise Exception.new(response.body)
    end
  end
end
