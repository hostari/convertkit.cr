@[EventPayload]
class ConvertKit::Broadcast::Stats
  include JSON::Serializable
  include ConvertKitMethods

  @[JSON::Field(key: "id")]
  getter broadcast_id : Int64

  class Data
    include JSON::Serializable

    getter recipients : Int32
    getter open_rate : Float64
    getter click_rate : Float64
    getter unsubscribes : Int32
    getter total_clicks : Int32
    getter show_total_clicks : Bool
    getter status : String
    getter progress : Float64
    getter open_tracking_disabled : Bool
    getter click_tracking_disabled : Bool
  end

  getter stats : Data
end
