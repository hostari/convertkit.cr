@[EventPayload]
class ConvertKit::Broadcast
  include JSON::Serializable
  include ConvertKitMethods

  add_retrieve_method(broadcasts)

  getter id : Int64
  getter created_at : Time
  getter subject : String
  getter description : String?
  getter content : String
  getter public : Bool
  getter published_at : Time
  getter send_at : Time
  getter thumbnail_alt : String?
  getter thumbnail_url : String?
  getter email_address : String
  getter email_layout_template : String
end
