require "../spec_helper"

describe ConvertKit::Tags do
  it "list tags" do
    WebMockWrapper.stub(:get, "list_tags.json", "/tags")

    tags = ConvertKit::Tags.list
    tags.first.id.should eq(3919712)
  end

  it "create a tag" do
    WebMockWrapper.stub(:post, "create_tag.json", "/tags", 201)

    tag = ConvertKit::Tags.create({name: "House Stark"})
    tag.name.should eq("House Stark")
    tag.should be_a(ConvertKit::Tags::Tag)
  end
end
