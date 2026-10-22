<!-- Start SDK Example Usage [usage] -->
```ruby
require "moderation_api"

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: "<YOUR_BEARER_TOKEN_HERE>"
)

req = Models::Operations::SubmitContentRequest.new(
  content: Models::Operations::TextRequest.new(
    type: "text",
    text: "Hey, check out my profile for a deal!"
  ),
  content_id: "message-48213",
  author_id: "user-1092",
  conversation_id: "room-general",
  metadata: {
    "platform" => "ios"
  }
)
res = s.content.submit(request: req)

unless res.object.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->