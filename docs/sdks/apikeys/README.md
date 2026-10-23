# Projects.ApiKeys

## Overview

### Available Operations

* [create](#create) - Create a project API key

## create

Create a new secret API key for a project and return it. Give each app or computer its own key, so you can revoke one without breaking the others. The project's existing keys keep working. Needs the `projects:write` permission.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="createProjectApiKey" method="post" path="/projects/{id}/api-keys" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.projects.api_keys.create(id: '<id>', body: Models::Operations::CreateProjectApiKeyRequestBody.new)

unless res.project_api_key.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                       | Type                                                                                                            | Required                                                                                                        | Description                                                                                                     |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                            | *::String*                                                                                                      | :heavy_check_mark:                                                                                              | The ID of the project.                                                                                          |
| `body`                                                                                                          | [Models::Operations::CreateProjectApiKeyRequestBody](../../models/operations/createprojectapikeyrequestbody.md) | :heavy_check_mark:                                                                                              | N/A                                                                                                             |

### Response

**[T.nilable(Models::Operations::CreateProjectApiKeyResponse)](../../models/operations/createprojectapikeyresponse.md)**

### Errors

| Error Type                            | Status Code                           | Content Type                          |
| ------------------------------------- | ------------------------------------- | ------------------------------------- |
| Models::Errors::BadRequestError       | 400                                   | application/json                      |
| Models::Errors::AuthenticationError   | 401                                   | application/json                      |
| Models::Errors::PermissionDeniedError | 403                                   | application/json                      |
| Models::Errors::NotFoundError         | 404                                   | application/json                      |
| Models::Errors::RateLimitError        | 429                                   | application/json                      |
| Errors::APIError                      | 4XX, 5XX                              | \*/\*                                 |