class ConvertKit::Forms
  def self.subscribe(id : Int64, email : String, first_name : String? = nil, tags : String? = nil)
    io = IO::Memory.new
    builder = ParamsBuilder.new(io)

    {% for x in %w(first_name email tags) %}
      builder.add({{x}}, {{x.id}}) unless {{x.id}}.nil?
    {% end %}

    response = ConvertKit.client.put("/v3/forms/#{id}/subscribe", form: io.to_s)

    if response.status_code == 200
      ConvertKit::Subscription.from_json(response.body, root: "subcsription")
    else
      raise Exception.new(response.body)
    end
  end
end

