module ConvertKitMethods
  extend self

  macro add_list_method(*arguments)
  {% begin %}
    def self.list({{*arguments}})
      io = IO::Memory.new
      builder = ParamsBuilder.new(io)

      {% for x in arguments.map &.var.id %}
        builder.add({{x.stringify}}, {{x.id}}) unless {{x.id}}.nil?
      {% end %}

      {% resource = @type.id.gsub(/ConvertKit::/, "").underscore %}

      response = ConvertKit.client.get("/v3/#{"{{resource}}"}", form: io.to_s)

      if response.status_code == 200
        {{@type.id}}.from_json(response.body).{{resource}}
      else
        raise Exception.new(response.body)
      end
    end

  {% end %}
  end
end
