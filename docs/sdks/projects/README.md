# Projects

## Overview

### Available Operations

* [list](#list) - List projects
* [create](#create) - Create a project
* [retrieve](#retrieve) - Get a project
* [update](#update) - Update a project
* [delete](#delete) - Delete a project
* [duplicate](#duplicate) - Duplicate a project

## list

List the projects in the organization. The list is paginated. Needs the `projects:read` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="listProjects" method="get" path="/projects" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.projects.list(page: 1, page_size: 20)

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

**[T.nilable(Models::Operations::ListProjectsResponse)](../../models/operations/listprojectsresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## create

Create a project with one channel, a review queue inbox and a secret API key. Give a domain or context and the project suggests policies for the platform. Needs the `projects:write` permission and a key that reaches all projects.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createProject" method="post" path="/projects" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)

req = Models::Operations::CreateProjectRequest.new(
  name: '<value>'
)
res = s.projects.create(request: req)

unless res.project_with_key.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                   | Type                                                                                        | Required                                                                                    | Description                                                                                 |
| ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `request`                                                                                   | [Models::Operations::CreateProjectRequest](../../models/operations/createprojectrequest.md) | :heavy_check_mark:                                                                          | The request object to use for the request.                                                  |

### Response

**[T.nilable(Models::Operations::CreateProjectResponse)](../../models/operations/createprojectresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## retrieve

Get a project by ID. Needs the `projects:read` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getProject" method="get" path="/projects/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.projects.retrieve(id: '<id>')

unless res.project.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `id`                   | *::String*             | :heavy_check_mark:     | The ID of the project. |

### Response

**[T.nilable(Models::Operations::GetProjectResponse)](../../models/operations/getprojectresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## update

Update a project. Fields you leave out keep their value. Needs the `projects:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="updateProject" method="put" path="/projects/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.projects.update(id: '<id>', body: Models::Operations::UpdateProjectRequestBody.new)

unless res.project.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                           | Type                                                                                                | Required                                                                                            | Description                                                                                         |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `id`                                                                                                | *::String*                                                                                          | :heavy_check_mark:                                                                                  | The ID of the project to update.                                                                    |
| `body`                                                                                              | [Models::Operations::UpdateProjectRequestBody](../../models/operations/updateprojectrequestbody.md) | :heavy_check_mark:                                                                                  | N/A                                                                                                 |

### Response

**[T.nilable(Models::Operations::UpdateProjectResponse)](../../models/operations/updateprojectresponse.md)**

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

Delete a project with everything in it: channels, queues, API keys and stored content. This can't be undone. The project's API keys stop working at once. Needs the `projects:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="deleteProject" method="delete" path="/projects/{id}" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.projects.delete(id: '<id>')

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter              | Type                   | Required               | Description            |
| ---------------------- | ---------------------- | ---------------------- | ---------------------- |
| `id`                   | *::String*             | :heavy_check_mark:     | The ID of the project. |

### Response

**[T.nilable(Models::Operations::DeleteProjectResponse)](../../models/operations/deleteprojectresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |

## duplicate

Copy a project's configuration into a new project: its settings, every channel with its policies, rules and wordlists, its moderation actions and its review queues. The copy gets its own secret API key. Webhooks, integrations, API keys and content are not copied. Needs the `projects:write` permission and a key that reaches all projects.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="duplicateProject" method="post" path="/projects/{id}/duplicate" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.projects.duplicate(id: '<id>', body: Models::Operations::DuplicateProjectRequestBody.new)

unless res.project_with_key.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                      | *::String*                                                                                                | :heavy_check_mark:                                                                                        | The ID of the project to copy.                                                                            |
| `body`                                                                                                    | [Models::Operations::DuplicateProjectRequestBody](../../models/operations/duplicateprojectrequestbody.md) | :heavy_check_mark:                                                                                        | N/A                                                                                                       |

### Response

**[T.nilable(Models::Operations::DuplicateProjectResponse)](../../models/operations/duplicateprojectresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |