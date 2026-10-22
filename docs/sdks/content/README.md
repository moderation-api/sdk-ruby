# Content

## Overview

### Available Operations

* [submit](#submit)

## submit

### Example Usage

<!-- UsageSnippet language="ruby" operationID="submitContent" method="post" path="/moderate" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::SubmitContentRequest.new(
  content: Models::Operations::TextRequest.new(
    type: 'text',
    text: 'Hey, check out my profile for a deal!'
  ),
  content_id: 'message-48213',
  author_id: 'user-1092',
  conversation_id: 'room-general',
  metadata: {
    'platform' => 'ios',
  }
)
res = s.content.submit(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::SubmitContentRequest](../../models/operations/submitcontentrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::SubmitContentResponse)](../../models/operations/submitcontentresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Models::Errors::InternalServerError   | 500                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |