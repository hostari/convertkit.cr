class ConvertKit::Tags
  def self.create(tag : NamedTuple(name: String) | Array(NamedTuple(name: String)))
    io = IO::Memory.new
    builder = ParamsBuilder.new(io)

    {% for x in %w(tag) %}
      builder.add({{x}}, {{x.id}}) unless {{x.id}}.nil?
    {% end %}

    response = ConvertKit.client.post("/v3/tags", form: io.to_s)

    if response.status_code == 201
      ConvertKit::Tags::Tag.from_json(response.body)
    else
      raise Exception.new(response.body)
    end
  end
end
