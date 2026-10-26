# Queue.Items

## Overview

### Available Operations

* [list](#list) - List queue items
* [resolve](#resolve) - Resolve a queue item
* [resolve_many](#resolve_many) - Resolve queue items
* [unresolve](#unresolve) - Unresolve a queue item

## list

List the items of a review queue, with the filters and the date window of the queue applied. By default only pending items. The list is paginated. Use the item `id` to resolve or unresolve an item.

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

Mark an item of a queue as resolved. It is the same as a check-off in the dashboard: the item leaves the pending list and a QUEUE_ITEM_COMPLETED webhook is sent. To also take a moderation action, use `POST /actions/execute`.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="resolveQueueItem" method="post" path="/queue/{id}/items/{itemId}/resolve" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.queue.items.resolve(id: '<id>', item_id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                                                                         | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | The queue ID.                                                                                                                                                                                                                                |
| `item_id`                                                                                                                                                                                                                                    | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | The item ID to resolve.                                                                                                                                                                                                                      |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

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

## resolve_many

Mark up to 100 items of a queue as resolved in one request. Each item is resolved the same as with `POST /queue/{id}/items/{itemId}/resolve`. IDs that do not exist in the project are skipped and returned in `notFoundIds`.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="resolveQueueItems" method="post" path="/queue/{id}/items/resolve" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.queue.items.resolve_many(id: '<id>', body: Models::Operations::ResolveQueueItemsRequestBody.new(
  item_ids: [
    'clx8k2v0e000108l4a9bz3f7q',
    'clx8k2v0e000208l4h2mc6d1r',
  ]
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                                                                         | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | The queue ID.                                                                                                                                                                                                                                |
| `body`                                                                                                                                                                                                                                       | [Models::Operations::ResolveQueueItemsRequestBody](../../models/operations/resolvequeueitemsrequestbody.md)                                                                                                                                  | :heavy_check_mark:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::ResolveQueueItemsResponse)](../../models/operations/resolvequeueitemsresponse.md)**

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

Mark a resolved item of a queue as pending again. It is the same as removing a check-off in the dashboard: the item comes back in the pending list.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="unresolveQueueItem" method="post" path="/queue/{id}/items/{itemId}/unresolve" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.queue.items.unresolve(id: '<id>', item_id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                                                                         | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | The queue ID.                                                                                                                                                                                                                                |
| `item_id`                                                                                                                                                                                                                                    | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | The item ID to unresolve.                                                                                                                                                                                                                    |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

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