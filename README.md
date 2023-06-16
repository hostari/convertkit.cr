# convertkit.cr

convertkit.cr is a Crystal API Client for the [ConvertKit API](https://developers.convertkit.com/)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     convertkit:
       github: hostari/convertkit.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "convertkit.cr"

# Set your API secret
ConvertKit.api_secret = "api-secret-here"

# Retrieving subscribers
subscribers = ConvertKit::Subscribers.retrieve.subscribers

# Iterate through each subscriber
subscribers.each do |subscriber|
  puts subscriber
end

# Creating a Tag
ConvertKit::Tags.create({name: "Email Newsletter"})
```


## API endpoints


| Method description | Method | HTTP Method | Path |
|----|---|---|---|
Show current account | `Account.retrieve` | GET | /v3/account
List forms | `Forms.list` | GET | /v3/forms
Add subscriber to a form | `Forms.subscribe` | POST | /v3/forms/:form_id/subscribe
List subscriptions to a form | `Forms::Subscriptions.retrieve(form_id)` | GET | /v3/forms/:form_id/subscriptions
List sequences | `Sequences.list` | GET | /v3/sequences
Add subscriber to a sequence | `Sequences.subscribe` | POST | /v3/sequences/:sequence_id/subscribe
List subscriber to a sequence | `Sequences::Subscriptions.retrieve(id)` | GET | /v3/sequences/:id/subscriptions
List tags | `Tags.list` | GET | /v3/tags
Create a tag | `Tags.create(tag: NamedTuple(name: String))` | POST | /v3/tags
Tag a subscriber | - | POST | /v3/tags/:id/subscribe
Remove tag from a subscriber | `Tags.unsubscribe(sub_id, tag_id)` | DELETE | /v3/subscribers/:subscriber_id/tags/:tag_id
Remove tag from a subscriber by email | `Tags.unsubscribe(id, email)` | POST | /v3/tags/:id/unsubscribe
List subscriptions to a tag | `Tags::Subscriptions.retrieve(id)` | POST | /v3/tags/:tag_id/unsubscribe
List subscribers | `Subscribers.retrieve` | GET | /v3/subscribers
View a single subscriber | `Subscriber.retrieve(id)` | GET | /v3/subscribers/:subscriber_id
Update a subscriber | `Subscriber.update(id, first_name : String? = nil, email_address : String? = nil)` | PUT | /v3/subscribers/:id
Unsubscribe a subscriber | `Subscriber.unscubscribe(email)` | PUT | /v3/unsubscribe
List tags for a subscriber | `Subscriber.tags(id)` | GET | /v3/subscribers/:id/tags
List broadcasts | - | GET | /v3/broadcasts
Create broadcast | - | POST | /v3/broadcasts
View a broadcast | - | GET | /v3/broadcasts/:id
Get stats | - | GET | /v3/broadcasts/:id/stats
Update broadcast | - | PUT | /v3/broadcasts/:id
Delete broadcast | - | DELETE | /v3/broadcasts/:id
List purchases | - | GET | /v3/purchases
View a purchase | - | GET | /v3/purchases/:id
Create a purchase | - | POST | /v3/purchases
Create a purchase | - | POST | /v3/purchases

## Contributing

1. Fork it (<https://github.com/your-github-user/convertkit/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [jcads](https://github.com/jcads) - creator and maintainer
