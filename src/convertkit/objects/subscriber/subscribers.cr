@[EventPayload]
class ConvertKit::Subscribers
  include JSON::Serializable
  include ConvertKitMethods

  add_retrieve_method

  getter total_subscribers : Int32
  getter page : Int32
  getter total_pages : Int32

  getter subscribers : Array(Subscriber)
end
