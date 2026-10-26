# Content

## Overview

### Available Operations

* [submit](#submit) - Submit content

## submit

Submit content

### Example Usage

<!-- UsageSnippet language="ruby" operationID="submitContent" method="post" path="/moderate" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.content.submit(body: Models::Operations::SubmitContentRequestBody.new(
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
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `body`                                                                                                                                                                                                                                       | [Models::Operations::SubmitContentRequestBody](../../models/operations/submitcontentrequestbody.md)                                                                                                                                          | :heavy_check_mark:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

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