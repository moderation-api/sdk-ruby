# Feedback

## Overview

### Available Operations

* [create](#create) - Send feedback

## create

Sends a feature request, bug report or other feedback to the Moderation API team. The team reads every request and can reply by email. Limited to 5 requests per minute per organization.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createFeedback" method="post" path="/feedback" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.feedback.create(body: Models::Operations::CreateFeedbackRequestBody.new(
  title: 'Filter queue items by author trust level',
  description: 'We review queue items by hand. We want to see items from new authors first, so we need a filter for trust level on the queue items list.',
  source: Models::Operations::Source::MCP
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `body`                                                                                                                                                                                                                                       | [Models::Operations::CreateFeedbackRequestBody](../../models/operations/createfeedbackrequestbody.md)                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::CreateFeedbackResponse)](../../models/operations/createfeedbackresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |