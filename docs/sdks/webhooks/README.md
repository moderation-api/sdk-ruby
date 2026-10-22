# Webhooks

## Overview

### Available Operations

* [list](#list) - List webhooks
* [create](#create) - Create a webhook
* [retrieve](#retrieve) - Get a webhook
* [update](#update) - Update a webhook
* [delete](#delete) - Delete a webhook

## list

List the webhooks of the project. The list is paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="listWebhooks" method="get" path="/webhooks" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.webhooks.list(page: 1, page_size: 20)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `page`                 | *T.nilable(::Integer)* | :heavy_minus_sign:     | N/A                    |
| `page_size`            | *T.nilable(::Integer)* | :heavy_minus_sign:     | N/A                    |

### Response

**[T.nilable(Models::Operations::ListWebhooksResponse)](../../models/operations/listwebhooksresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## create

Create a webhook subscribed to one or more event types. Deliveries use the v2 envelope and are signed with the project signing secret (see the signing secret endpoint).

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createWebhook" method="post" path="/webhooks" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::CreateWebhookRequest.new(
  name: 'Moderation events',
  url: 'https://example.com/webhooks/moderation',
  event_types: [
    Models::Operations::CreateWebhookEventTypeRequest::QUEUE_ITEM_REJECTED,
    Models::Operations::CreateWebhookEventTypeRequest::AUTHOR_BLOCKED,
  ]
)
res = s.webhooks.create(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::CreateWebhookRequest](../../models/operations/createwebhookrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::CreateWebhookResponse)](../../models/operations/createwebhookresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## retrieve

Get a webhook by ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getWebhook" method="get" path="/webhooks/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.webhooks.retrieve(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                     | Type                          | Required                      | Description                   |
| ----------------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| `id`                          | *::String*                    | :heavy_check_mark:            | The ID of the webhook to get. |

### Response

**[T.nilable(Models::Operations::GetWebhookResponse)](../../models/operations/getwebhookresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## update

Update a webhook. Legacy v1 webhooks are read-only: delete them and create a new webhook instead.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateWebhook" method="put" path="/webhooks/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.webhooks.update(id: '<id>', body: Models::Operations::UpdateWebhookRequestBody.new)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `id`                                                                                                | *::String*                                                                                          | :heavy_check_mark:                                                                                  | The ID of the webhook to update.                                                                    |
| `body`                                                                                              | [Models::Operations::UpdateWebhookRequestBody](../../models/operations/updatewebhookrequestbody.md) | :heavy_check_mark:                                                                                  | N/A                                                                                                 |

### Response

**[T.nilable(Models::Operations::UpdateWebhookResponse)](../../models/operations/updatewebhookresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## delete

Delete a webhook.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteWebhook" method="delete" path="/webhooks/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.webhooks.delete(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                        | Type                             | Required                         | Description                      |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| `id`                             | *::String*                       | :heavy_check_mark:               | The ID of the webhook to delete. |

### Response

**[T.nilable(Models::Operations::DeleteWebhookResponse)](../../models/operations/deletewebhookresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |