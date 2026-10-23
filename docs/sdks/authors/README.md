# Authors

## Overview

### Available Operations

* [list](#list) - List authors
* [create](#create) - Create a new author
* [retrieve](#retrieve) - Get author details
* [update](#update) - Update author details
* [delete](#delete) - Delete an author

## list

List authors with their activity metrics and reputation. The list is paginated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="listAuthors" method="get" path="/authors" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::ListAuthorsRequest.new
res = s.authors.list(request: req)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                               | Type                                                                                    | Required                                                                                | Description                                                                             |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `request`                                                                               | [Models::Operations::ListAuthorsRequest](../../models/operations/listauthorsrequest.md) | :heavy_check_mark:                                                                      | The request object to use for the request.                                              |

### Response

**[T.nilable(Models::Operations::ListAuthorsResponse)](../../models/operations/listauthorsresponse.md)**

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

Create a new author. Typically not needed as authors are created automatically when content is moderated.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createAuthor" method="post" path="/authors" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.authors.create(body: Models::Operations::CreateAuthorRequestBody.new(
  name: 'Jamie Rivera',
  email: 'jamie@example.com',
  metadata: Models::Operations::CreateAuthorMetadata.new(
    email_verified: true,
    is_paying_customer: false
  ),
  external_id: 'user-1092'
))

unless res.public_author.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `body`                                                                                                                                                                                                                                       | [Models::Operations::CreateAuthorRequestBody](../../models/operations/createauthorrequestbody.md)                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::CreateAuthorResponse)](../../models/operations/createauthorresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Models::Errors::InternalServerError   | 500                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## retrieve

Get detailed information about a specific author including historical data and analysis

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAuthor" method="get" path="/authors/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.authors.retrieve(id: '<id>')

unless res.public_author.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                                                                         | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | Either external ID or the ID assigned by moderation API.                                                                                                                                                                                     |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAuthorResponse)](../../models/operations/getauthorresponse.md)**

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

## update

Update the details of a specific author

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateAuthor" method="put" path="/authors/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.authors.update(id: '<id>', body: Models::Operations::UpdateAuthorRequestBody.new(
  metadata: Models::Operations::UpdateAuthorMetadata.new(
    identity_verified: true
  ),
  manual_trust_level: 2.0
))

unless res.public_author.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                                                                         | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | Either external ID or the ID assigned by moderation API.                                                                                                                                                                                     |
| `body`                                                                                                                                                                                                                                       | [Models::Operations::UpdateAuthorRequestBody](../../models/operations/updateauthorrequestbody.md)                                                                                                                                            | :heavy_check_mark:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::UpdateAuthorResponse)](../../models/operations/updateauthorresponse.md)**

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

## delete

Delete a specific author. This resets the author: status, blocks, trust level, metrics and action history are removed. The author is created again with a clean record the next time content is moderated for the same ID.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteAuthor" method="delete" path="/authors/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.authors.delete(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                                                                                                                                                         | *::String*                                                                                                                                                                                                                                   | :heavy_check_mark:                                                                                                                                                                                                                           | Either external ID or the ID assigned by moderation API.                                                                                                                                                                                     |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::DeleteAuthorResponse)](../../models/operations/deleteauthorresponse.md)**

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