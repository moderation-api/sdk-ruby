# Analytics

## Overview

### Available Operations

* [summary](#summary) - Get the analytics summary
* [policies](#policies) - Get the most flagged policies
* [authors](#authors) - Get the most flagged authors
* [channels](#channels) - Get analytics per channel
* [volumes](#volumes) - Get volumes over time
* [automation](#automation) - Get the automation breakdown

## summary

Get the totals of the project for a time window: requests, flags, flag rate, allowed, rejected and sent to review, with the window before for the trend. Also the review queue backlog and a flag-rate spike, if there is one.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAnalyticsSummary" method="get" path="/analytics/summary" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.analytics.summary(range: Models::Operations::GetAnalyticsSummaryQueryParamRange::THIRTYD)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                                                                                                                                                      | [T.nilable(Models::Operations::GetAnalyticsSummaryQueryParamRange)](../../models/operations/getanalyticssummaryqueryparamrange.md)                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                           | The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.                                                                                              |
| `channel`                                                                                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAnalyticsSummaryResponse)](../../models/operations/getanalyticssummaryresponse.md)**

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

## policies

Get the policy labels that flagged the most content in a time window, largest first, with the count in the window before.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAnalyticsPolicies" method="get" path="/analytics/policies" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.analytics.policies(range: Models::Operations::GetAnalyticsPoliciesQueryParamRange::THIRTYD, limit: 8)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                                                                                                                                                      | [T.nilable(Models::Operations::GetAnalyticsPoliciesQueryParamRange)](../../models/operations/getanalyticspoliciesqueryparamrange.md)                                                                                                         | :heavy_minus_sign:                                                                                                                                                                                                                           | The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.                                                                                              |
| `channel`                                                                                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `limit`                                                                                                                                                                                                                                      | *T.nilable(::Integer)*                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAnalyticsPoliciesResponse)](../../models/operations/getanalyticspoliciesresponse.md)**

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

## authors

Get the authors with the most flagged content in a time window, largest first.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAnalyticsAuthors" method="get" path="/analytics/authors" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.analytics.authors(range: Models::Operations::GetAnalyticsAuthorsQueryParamRange::THIRTYD, limit: 6)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                                                                                                                                                      | [T.nilable(Models::Operations::GetAnalyticsAuthorsQueryParamRange)](../../models/operations/getanalyticsauthorsqueryparamrange.md)                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                           | The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.                                                                                              |
| `channel`                                                                                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `limit`                                                                                                                                                                                                                                      | *T.nilable(::Integer)*                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAnalyticsAuthorsResponse)](../../models/operations/getanalyticsauthorsresponse.md)**

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

## channels

Get requests, flags and flag rate for each channel of the project in a time window.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAnalyticsChannels" method="get" path="/analytics/channels" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.analytics.channels(range: Models::Operations::GetAnalyticsChannelsQueryParamRange::THIRTYD)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                                                                                                                                                      | [T.nilable(Models::Operations::GetAnalyticsChannelsQueryParamRange)](../../models/operations/getanalyticschannelsqueryparamrange.md)                                                                                                         | :heavy_minus_sign:                                                                                                                                                                                                                           | The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.                                                                                              |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAnalyticsChannelsResponse)](../../models/operations/getanalyticschannelsresponse.md)**

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

## volumes

Get requests, flags, rejections and reviews per hour (24h) or per day (7d, 30d, 90d), oldest first.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAnalyticsVolumes" method="get" path="/analytics/volumes" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.analytics.volumes(range: Models::Operations::GetAnalyticsVolumesQueryParamRange::THIRTYD)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                                                                                                                                                      | [T.nilable(Models::Operations::GetAnalyticsVolumesQueryParamRange)](../../models/operations/getanalyticsvolumesqueryparamrange.md)                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                           | The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.                                                                                              |
| `channel`                                                                                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAnalyticsVolumesResponse)](../../models/operations/getanalyticsvolumesresponse.md)**

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

## automation

Get how flagged content was handled in a time window: settled by rules or the casebook, or sent to human review, and what the reviewers decided.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAnalyticsAutomation" method="get" path="/analytics/automation" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.analytics.automation(range: Models::Operations::GetAnalyticsAutomationQueryParamRange::THIRTYD)

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `range`                                                                                                                                                                                                                                      | [T.nilable(Models::Operations::GetAnalyticsAutomationQueryParamRange)](../../models/operations/getanalyticsautomationqueryparamrange.md)                                                                                                     | :heavy_minus_sign:                                                                                                                                                                                                                           | The time window. `24h` is the last 24 hours, in hourly buckets. `7d`, `30d` and `90d` are whole UTC days that end with today, in daily buckets.                                                                                              |
| `channel`                                                                                                                                                                                                                                    | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | N/A                                                                                                                                                                                                                                          |
| `project_id`                                                                                                                                                                                                                                 | *T.nilable(::String)*                                                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                                                           | The project to act on, by ID or name. Required with an organization key unless the key reaches only one project; list projects with GET /projects. A project key acts on its own project and needs no value: naming another one is an error. |

### Response

**[T.nilable(Models::Operations::GetAnalyticsAutomationResponse)](../../models/operations/getanalyticsautomationresponse.md)**

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