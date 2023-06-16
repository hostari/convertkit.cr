module ConvertKitMethods
  extend self

  macro add_list_subscriptions_method
    class Subscriptions
      include JSON::Serializable
      include ConvertKitMethods

      retrieve_method

      getter total_subscriptions : Int32
      getter page : Int32
      getter total_pages : Int32

      getter subscriptions : Array(Subscription)
    end
  end

  private macro retrieve_method
    def self.retrieve(resource_id : String | Int64)
      resource = "{{@type.id.gsub(/ConvertKit::/, "").underscore.gsub(/::subscriptions/, "")}}"
      response = ConvertKit.client.get("/v3/#{resource}/#{resource_id}/subscriptions")

      if response.status_code == 200
        {{@type.id}}.from_json(response.body)
      else
        raise Exception.new(response.body)
      end
    end
  end
end
