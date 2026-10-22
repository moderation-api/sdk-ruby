# Channels

## Overview

### Available Operations

* [list](#list) - List channels
* [create](#create) - Create a channel
* [retrieve](#retrieve) - Get a channel
* [update](#update) - Update a channel
* [delete](#delete) - Delete a channel
* [duplicate](#duplicate) - Duplicate a channel

## list

List the channels in a project. The list is paginated. Needs the `channels:read` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="listChannels" method="get" path="/projects/{projectId}/channels" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.channels.list(project_id: '<id>', page: 1, page_size: 20)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `project_id`           | *::String*             | :heavy_check_mark:     | The ID of the project. |
| `page`                 | *T.nilable(::Integer)* | :heavy_minus_sign:     | N/A                    |
| `page_size`            | *T.nilable(::Integer)* | :heavy_minus_sign:     | N/A                    |

### Response

**[T.nilable(Models::Operations::ListChannelsResponse)](../../models/operations/listchannelsresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## create

Create a channel in a project, with the default rules. The project's first channel becomes its default. Needs the `channels:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createChannel" method="post" path="/projects/{projectId}/channels" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.channels.create(project_id: '<id>', body: Models::Operations::CreateChannelRequestBody.new(
  name: '<value>'
))

unless res.channel.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `project_id`                                                                                        | *::String*                                                                                          | :heavy_check_mark:                                                                                  | The ID of the project to add the channel to.                                                        |
| `body`                                                                                              | [Models::Operations::CreateChannelRequestBody](../../models/operations/createchannelrequestbody.md) | :heavy_check_mark:                                                                                  | N/A                                                                                                 |

### Response

**[T.nilable(Models::Operations::CreateChannelResponse)](../../models/operations/createchannelresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## retrieve

Get a channel by ID. Needs the `channels:read` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getChannel" method="get" path="/channels/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.channels.retrieve(id: '<id>')

unless res.channel.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `id`                   | *::String*             | :heavy_check_mark:     | The ID of the channel. |

### Response

**[T.nilable(Models::Operations::GetChannelResponse)](../../models/operations/getchannelresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## update

Update a channel. Fields you leave out keep their value. Needs the `channels:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateChannel" method="put" path="/channels/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.channels.update(id: '<id>', body: Models::Operations::UpdateChannelRequestBody.new)

unless res.channel.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `id`                                                                                                | *::String*                                                                                          | :heavy_check_mark:                                                                                  | The ID of the channel to update.                                                                    |
| `body`                                                                                              | [Models::Operations::UpdateChannelRequestBody](../../models/operations/updatechannelrequestbody.md) | :heavy_check_mark:                                                                                  | N/A                                                                                                 |

### Response

**[T.nilable(Models::Operations::UpdateChannelResponse)](../../models/operations/updatechannelresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## delete

Delete a channel. Its key is freed for a new channel. When it was the default, the oldest remaining channel becomes the default. A channel that still moderates a Slack workspace must be disconnected first. Needs the `channels:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteChannel" method="delete" path="/channels/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.channels.delete(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `id`                   | *::String*             | :heavy_check_mark:     | The ID of the channel. |

### Response

**[T.nilable(Models::Operations::DeleteChannelResponse)](../../models/operations/deletechannelresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## duplicate

Copy a channel in its project, with every setting, policy, rule and wordlist. Integrations (Discord, Slack, WordPress) are not copied. Needs the `channels:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="duplicateChannel" method="post" path="/channels/{id}/duplicate" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.channels.duplicate(id: '<id>', body: Models::Operations::DuplicateChannelRequestBody.new)

unless res.channel.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                      | *::String*                                                                                                | :heavy_check_mark:                                                                                        | The ID of the channel to copy.                                                                            |
| `body`                                                                                                    | [Models::Operations::DuplicateChannelRequestBody](../../models/operations/duplicatechannelrequestbody.md) | :heavy_check_mark:                                                                                        | N/A                                                                                                       |

### Response

**[T.nilable(Models::Operations::DuplicateChannelResponse)](../../models/operations/duplicatechannelresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |