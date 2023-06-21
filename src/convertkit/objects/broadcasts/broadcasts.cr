@[EventPayload]
class ConvertKit::Broadcasts
  include JSON::Serializable
  include ConvertKitMethods

  add_list_method

  class Broadcast
    include JSON::Serializable
    getter id : Int64
    getter subject : String
    getter created_at : Time
  end

  getter broadcasts : Array(Broadcast)
end
