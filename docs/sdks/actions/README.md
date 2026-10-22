# Actions

## Overview

### Available Operations

* [list](#list) - List moderation actions
* [create](#create) - Create an action
* [retrieve](#retrieve) - Get an action
* [update](#update) - Update an action
* [delete](#delete) - Delete an action
* [execute](#execute) - Execute moderation action

## list

List the moderation actions of the project. The list is paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="listActions" method="get" path="/actions" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.actions.list(page: 1, page_size: 20)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `queue_id`             | *T.nilable(::String)*  | :heavy_minus_sign:     | N/A                    |
| `page`                 | *T.nilable(::Integer)* | :heavy_minus_sign:     | N/A                    |
| `page_size`            | *T.nilable(::Integer)* | :heavy_minus_sign:     | N/A                    |

### Response

**[T.nilable(Models::Operations::ListActionsResponse)](../../models/operations/listactionsresponse.md)**

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

## create

Create an action.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createAction" method="post" path="/actions" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::CreateActionRequest.new(
  key: 'suspend-24h',
  name: 'Suspend for 24 hours',
  type: Models::Operations::CreateActionTypeRequest::AUTHOR_BLOCK_TEMP,
  queue_behaviour: Models::Operations::CreateActionQueueBehaviourRequest::REMOVE
)
res = s.actions.create(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                 | Type                                                                                      | Required                                                                                  | Description                                                                               |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `request`                                                                                 | [Models::Operations::CreateActionRequest](../../models/operations/createactionrequest.md) | :heavy_check_mark:                                                                        | The request object to use for the request.                                                |

### Response

**[T.nilable(Models::Operations::CreateActionResponse)](../../models/operations/createactionresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::ConflictError       | 409                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## retrieve

Get an action by ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAction" method="get" path="/actions/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.actions.retrieve(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                    | Type                         | Required                     | Description                  |
| ---------------------------- | ---------------------------- | ---------------------------- | ---------------------------- |
| `id`                         | *::String*                   | :heavy_check_mark:           | The ID of the action to get. |

### Response

**[T.nilable(Models::Operations::GetActionResponse)](../../models/operations/getactionresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## update

Update an action.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateAction" method="put" path="/actions/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.actions.update(id: '<id>', body: Models::Operations::UpdateActionRequestBody.new)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                         | Type                                                                                              | Required                                                                                          | Description                                                                                       |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `id`                                                                                              | *::String*                                                                                        | :heavy_check_mark:                                                                                | The ID of the action to update.                                                                   |
| `body`                                                                                            | [Models::Operations::UpdateActionRequestBody](../../models/operations/updateactionrequestbody.md) | :heavy_check_mark:                                                                                | N/A                                                                                               |

### Response

**[T.nilable(Models::Operations::UpdateActionResponse)](../../models/operations/updateactionresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::ConflictError       | 409                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## delete

Delete an action and all of its webhooks.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteAction" method="delete" path="/actions/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.actions.delete(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                       | Type                            | Required                        | Description                     |
| ------------------------------- | ------------------------------- | ------------------------------- | ------------------------------- |
| `id`                            | *::String*                      | :heavy_check_mark:              | The ID of the action to delete. |

### Response

**[T.nilable(Models::Operations::DeleteActionResponse)](../../models/operations/deleteactionresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## execute

Execute a moderation action on one or more content items.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="executeAction" method="post" path="/actions/execute" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::ExecuteActionRequest.new(
  action_key: 'suspend-24h',
  author_ids: [
    'user-1092',
  ]
)
res = s.actions.execute(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::ExecuteActionRequest](../../models/operations/executeactionrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::ExecuteActionResponse)](../../models/operations/executeactionresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |