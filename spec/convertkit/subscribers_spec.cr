require "../spec_helper"

describe ConvertKit::Subscribers do
  it "retrieve subscribers" do
    WebMockWrapper.stub(:get, "retrieve_subscribers.json", "/subscribers")

    subscribers = ConvertKit::Subscribers.retrieve
    subscribers.subscribers.first.id.should eq(2209009344)
  end
end
