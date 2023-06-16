@[EventPayload]
class ConvertKit::Tags
  include JSON::Serializable
  include ConvertKitMethods

  add_list_method
  add_list_subscriptions_method

  class Tag
    include JSON::Serializable
    getter id : Int64
    getter name : String
    getter created_at : Time
  end

  getter tags : Array(Tag)
end
