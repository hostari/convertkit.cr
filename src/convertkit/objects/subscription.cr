@[EventPayload]
class ConvertKit::Subscription
  include JSON::Serializable

  getter id : Int64
  getter state : String
  getter created_at : Time
  getter source : String?
  getter referrer : String?
  getter subscribable_id : Int64
  getter subscribable_type : String

  getter subscriber : Subscriber
end
