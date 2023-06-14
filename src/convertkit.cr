require "json"
require "http/client"

class ConvertKit
  BASE_URL = URI.parse("https://api.convertkit.com")

  @@api_secret : String?

  def self.api_secret=(api_secret)
    @@api_secret = api_secret
  end

  def self.api_secret
    @@api_secret
  end

  def self.client : HTTP::Client
    client = HTTP::Client.new(BASE_URL)

    client.before_request do |request|
      if api = @@api_secret
        request.query_params.add("api_secret", api)
      else
        raise Exception.new("api_secret not provided")
      end
    end

    client
  end
end

annotation EventPayload
end

require "./convertkit/**"
