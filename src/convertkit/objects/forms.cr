@[EventPayload]
class ConvertKit::Forms
  include JSON::Serializable
  include ConvertKitMethods

  add_list_method

	class Form
  	include JSON::Serializable
		getter id : Int64	
		getter name : String
		getter created_at : Time
		getter type : String
		getter embed_js : String
		getter embed_url : String
		getter archived : Bool
		getter uid : String
	end

	getter forms : Array(Form)
end
