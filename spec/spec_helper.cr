require "spec"
require "spec"
require "webmock"
Spec.before_each &->WebMock.reset
Spec.before_each { ConvertKit.api_secret = "test" }
require "../src/convertkit"

class WebMockWrapper
  API_URL = "https://api.convertkit.com/v3"

  def self.stub(method, body, path, status = 200)
    WebMock.stub(method, API_URL + path + "?api_secret=test")
      .to_return(status: status, body: File.read("spec/support/#{body}"), headers: {"Content-Type" => "application/json"})
  end
end
