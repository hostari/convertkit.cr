require "../spec_helper"

describe ConvertKit::Broadcasts do
  it "list forms" do
    WebMockWrapper.stub(:get, "list_broadcasts.json", "/broadcasts")

    broadcasts = ConvertKit::Broadcasts.list
    broadcasts.first.id.should eq(12019088)
  end
end

describe ConvertKit::Broadcast do
  it "retrieves a Broadcast" do
    id = 12019088
    WebMockWrapper.stub(:get, "retrieve_broadcast.json", "/broadcasts/#{id}")

    broadcast = ConvertKit::Broadcast.retrieve(id)
    broadcast.id.should eq(12019088)
  end

  it "get stats" do
    id = 12019088
    WebMockWrapper.stub(:get, "retrieve_broadcast_stats.json", "/broadcasts/#{id}/stats")

    stats = ConvertKit::Broadcast.stats(id)
    stats.broadcast_id.should eq(12019088)
    stats.stats.unsubscribes.should eq(39)
  end
end
