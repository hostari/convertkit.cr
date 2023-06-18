require "../spec_helper"

describe ConvertKit::Forms do
  it "list forms" do
    WebMockWrapper.stub(:get, "list_forms.json", "/forms")

    forms = ConvertKit::Forms.list
    forms.first.uid.should eq("282fd003d7")
  end

  it "subscribe to a form" do
    WebMockWrapper.stub(:post, "subscribe_form.json", "/forms/1/subscribe")

    subscription = ConvertKit::Forms.subscribe(1, "test@subscribe.com")
    subscription.id.should eq(6173502434)
    subscription.should be_a(ConvertKit::Subscription)
  end

  describe ConvertKit::Forms::Subscriptions do
    it "lists subscriptions for a form" do
      WebMockWrapper.stub(:get, "list_form_subscriptions.json", "/forms/5241392/subscriptions")

      subs = ConvertKit::Forms::Subscriptions.retrieve(5241392)
      subs.subscriptions.first.subscribable_id.should eq(5241392)
      subs.subscriptions.first.subscribable_type.should eq("form")
    end
  end
end
