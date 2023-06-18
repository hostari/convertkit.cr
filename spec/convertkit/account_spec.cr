require "../spec_helper"

describe ConvertKit::Account do
  it "retrieve account" do
    WebMockWrapper.stub(:get, "retrieve_account.json", "/account")

    account = ConvertKit::Account.retrieve
    account.primary_email_address.should eq("rafael@hostari.com")
  end
end
