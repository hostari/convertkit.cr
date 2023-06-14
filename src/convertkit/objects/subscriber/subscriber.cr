@[EventPayload]
class ConvertKit::Subscriber
  include JSON::Serializable
  include ConvertKitMethods

  add_retrieve_method(subscribers)

  getter id : Int64
  getter first_name : String?
  getter email_address : String
  getter state : String
  getter created_at : Time
  getter fields : JSON::Any
end

