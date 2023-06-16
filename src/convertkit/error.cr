class ConvertKit::Error < Exception
  include JSON::Serializable

  property error : String
  property message : String?
end
