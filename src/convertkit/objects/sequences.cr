@[EventPayload]
class ConvertKit::Sequences
  include JSON::Serializable
  include ConvertKitMethods

  add_list_method
  add_list_subscriptions_method

  class Course
    include JSON::Serializable
    getter id : Int64
    getter name : String
    getter created_at : Time
  end

  getter courses : Array(Course)
end
