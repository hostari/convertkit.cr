module ConvertKitMethods
  extend self

  macro add_retrieve_method(resource = "")
    def self.retrieve(id : Int64? = nil)
      {% if resource.id.stringify == "" %}
        res = "{{@type.id.gsub(/ConvertKit::/, "").underscore}}"
      {% else %}
        res = {{resource.stringify}}
      {% end %}

      path = "/v3/#{res}"
      if _id = id
        path += "/#{_id}"
      end

      response = ConvertKit.client.get(path)

      if response.status_code == 200
        # if **id** is present it means we are retrieving an individual resource and it will be
        # nested with the key as the property
        return {{@type.id}}.from_json(response.body, root: root_property(res)) if id
        
        return {{@type.id}}.from_json(response.body)
      else
        raise Exception.new(response.body)
      end
    end

    private def self.root_property(resource : String)
      if resource.ends_with?("s")
        resource[0, resource.size - 1]
      else
        resource
      end
    end
  end
end
