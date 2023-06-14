@[EventPayload]
class ConvertKit::Account
  include JSON::Serializable
  include ConvertKitMethods

  add_retrieve_method

  getter name : String
  getter primary_email_address : String
end
