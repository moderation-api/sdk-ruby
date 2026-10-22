# Queue.Items

## Overview

### Available Operations

* [list](#list) - Get queue items
* [resolve](#resolve) - Resolve a queue item
* [unresolve](#unresolve) - Unresolve a queue item

## list

Get paginated list of items in a moderation queue with filtering options

### Example Usage

<!-- UsageSnippet language="ruby" operationID="listQueueItems" method="get" path="/queue/{id}/items" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::ListQueueItemsRequest.new(
  id: '<id>'
)
res = s.queue.items.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `request`                                                                                     | [Models::Operations::ListQueueItemsRequest](../../models/operations/listqueueitemsrequest.md) | :heavy_check_mark:                                                                            | The request object to use for the request.                                                    |

### Response

**[T.nilable(Models::Operations::ListQueueItemsResponse)](../../models/operations/listqueueitemsresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Models::Errors::InternalServerError   | 500                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## resolve

Mark a queue item as resolved with a specific moderation action

### Example Usage

<!-- UsageSnippet language="ruby" operationID="resolveQueueItem" method="post" path="/queue/{id}/items/{itemId}/resolve" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.queue.items.resolve(id: '<id>', item_id: '<id>', body: Models::Operations::ResolveQueueItemRequestBody.new(
  comment: 'Reviewed: no violation.'
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                             | Type                                                                                                                                                                                  | Required                                                                                                                                                                              | Description                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                  | *::String*                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                    | The queue ID                                                                                                                                                                          |
| `item_id`                                                                                                                                                                             | *::String*                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                    | The item ID to resolve                                                                                                                                                                |
| `body`                                                                                                                                                                                | [Models::Operations::ResolveQueueItemRequestBody](../../models/operations/resolvequeueitemrequestbody.md)                                                                             | :heavy_check_mark:                                                                                                                                                                    | N/A                                                                                                                                                                                   |
| `project_id`                                                                                                                                                                          | *T.nilable(::String)*                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                    | The project to act on, when you call with an organization key. Optional when the organization has one project. A project key acts on its own project: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::ResolveQueueItemResponse)](../../models/operations/resolvequeueitemresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Models::Errors::InternalServerError   | 500                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## unresolve

Mark a previously resolved queue item as unresolved/pending

### Example Usage

<!-- UsageSnippet language="ruby" operationID="unresolveQueueItem" method="post" path="/queue/{id}/items/{itemId}/unresolve" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.queue.items.unresolve(id: '<id>', item_id: '<id>', body: Models::Operations::UnresolveQueueItemRequestBody.new(
  comment: 'Reopened after an appeal.'
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                             | Type                                                                                                                                                                                  | Required                                                                                                                                                                              | Description                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                  | *::String*                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                    | The queue ID                                                                                                                                                                          |
| `item_id`                                                                                                                                                                             | *::String*                                                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                    | The item ID to unresolve                                                                                                                                                              |
| `body`                                                                                                                                                                                | [Models::Operations::UnresolveQueueItemRequestBody](../../models/operations/unresolvequeueitemrequestbody.md)                                                                         | :heavy_check_mark:                                                                                                                                                                    | N/A                                                                                                                                                                                   |
| `project_id`                                                                                                                                                                          | *T.nilable(::String)*                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                    | The project to act on, when you call with an organization key. Optional when the organization has one project. A project key acts on its own project: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::UnresolveQueueItemResponse)](../../models/operations/unresolvequeueitemresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Models::Errors::InternalServerError   | 500                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |