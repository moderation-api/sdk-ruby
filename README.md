<!-- Start Custom [intro] -->
# Moderation API Ruby SDK

[![Gem](https://img.shields.io/gem/v/moderation_api.svg)](https://rubygems.org/gems/moderation_api)

The official Ruby library for [Moderation API](https://moderationapi.com). Use it to moderate text, images, video and audio, manage authors, review queues, actions and wordlists, and verify webhooks. It includes [Sorbet](https://sorbet.org) type signatures.

- Get an API key in the [dashboard](https://dash.moderationapi.com).
- Read the [documentation](https://docs.moderationapi.com) and the [API reference](https://docs.moderationapi.com/api-reference/introduction).
<!-- End Custom [intro] -->

<!-- Start Summary [summary] -->
## Summary

Moderation API: Moderate text, images, video and audio in real time, manage authors, review queues and actions, and receive webhooks.

More information about the API can be found at https://docs.moderationapi.com
<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [Moderation API Ruby SDK](#moderation-api-ruby-sdk)
  * [SDK Installation](#sdk-installation)
  * [SDK Example Usage](#sdk-example-usage)
  * [Moderating content](#moderating-content)
  * [Verifying webhooks](#verifying-webhooks)
  * [Authentication](#authentication)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
  * [Timeouts](#timeouts)
  * [Requirements](#requirements)
  * [Support](#support)
* [Development](#development)
  * [Maturity](#maturity)
  * [Contributions](#contributions)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

The SDK can be installed using [RubyGems](https://rubygems.org/):

```bash
gem install moderation_api
```
<!-- End SDK Installation [installation] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```ruby
require "moderation_api"

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: "<YOUR_BEARER_TOKEN_HERE>"
)
res = s.content.submit(
  body: Models::Operations::SubmitContentRequestBody.new(
    content: Models::Operations::TextRequest.new(
      type: "text",
      text: "Hey, check out my profile for a deal!"
    ),
    content_id: "message-48213",
    author_id: "user-1092",
    conversation_id: "room-general",
    metadata: {
      "platform" => "ios"
    }
  )
)

unless res.object.nil?
  # handle response
end

```
<!-- End SDK Example Usage [usage] -->
<!-- Start Custom [guide] -->
## Moderating content

Use `content.submit` to moderate text, images, video, audio, or objects with several fields. All parameters except `content` are optional.

Pass your API key as `secret_key`. The examples read it from the `MODAPI_SECRET_KEY` environment variable.

```ruby
require "moderation_api"

Operations = ModerationApi::Models::Operations
client = ModerationApi::ModerationApi.new(secret_key: ENV.fetch("MODAPI_SECRET_KEY"))

# Text
client.content.submit(body: Operations::SubmitContentRequestBody.new(
  content: Operations::TextRequest.new(text: "Your text here"),
  content_id: "message-123", # your ID for the content
  author_id: "user-123", # your ID for the user who wrote it
  conversation_id: "room-123", # groups related content
  metadata: { platform: "ios" }
))

# Image, video and audio: send a URL
client.content.submit(body: Operations::SubmitContentRequestBody.new(
  content: Operations::ImageRequest.new(url: "https://example.com/image.jpg")
))
client.content.submit(body: Operations::SubmitContentRequestBody.new(
  content: Operations::VideoRequest.new(url: "https://example.com/video.mp4")
))
client.content.submit(body: Operations::SubmitContentRequestBody.new(
  content: Operations::AudioRequest.new(url: "https://example.com/audio.mp3")
))

# An object with several fields, moderated together
client.content.submit(body: Operations::SubmitContentRequestBody.new(
  content: Operations::Object.new(data: {
    title: Operations::DataText.new(text: "Post title"),
    body: Operations::DataText.new(text: "Post content"),
    thumbnail: Operations::DataImage.new(url: "https://example.com/thumb.jpg")
  })
))
```

### Using the result

`evaluation.flagged` tells you if any policy flagged the content. `recommendation.action` is the action the API recommends after it applies your thresholds and rules: `allow`, `review` or `reject`.

```ruby
response = client.content.submit(body: Operations::SubmitContentRequestBody.new(
  content: Operations::TextRequest.new(text: "Some content")
))
result = response.object

puts "A policy flagged the content" if result.evaluation.flagged

case result.recommendation.action.serialize
when "reject"
  # Block the content
when "review"
  # Publish or hold it, and send it to a review queue
when "allow"
  # Publish the content
end

result.policies.each do |policy|
  puts "#{policy.id}: flagged=#{policy.flagged}"
end
```

## Verifying webhooks

Moderation API signs every webhook delivery with your project's webhook signing secret. The signature is in the `modapi-signature` header.

### Webhook signing secret

Find the secret on the [API keys page in the dashboard](https://dash.moderationapi.com/project/latest/configure/api-keys), or get it with `client.webhook_secret.retrieve`. Store it in the `MODAPI_WEBHOOK_SECRET` environment variable. It is not your API key. Get it once, for example in a setup script, and do not call `retrieve` for each delivery, so verification does not depend on a call to the API. Keep it as secret as your API key: anyone with it can sign webhooks.

### Verify a delivery

`ModerationApi::WebhookSignature.construct_event` checks the signature against the raw body and returns the event as a Hash. It reads the secret from `MODAPI_WEBHOOK_SECRET`; to set it in code, pass it as the third argument. It raises `ModerationApi::WebhookSignature::VerificationError` if the signature does not match.

```ruby
require "moderation_api/webhook_signature"

# For example, in a Rails controller
def moderation_webhook
  event = ModerationApi::WebhookSignature.construct_event(
    request.raw_post, # the raw body, not parsed JSON
    request.headers["modapi-signature"]
  )
  Rails.logger.info(event["type"])
  head :ok
rescue ModerationApi::WebhookSignature::VerificationError
  head :bad_request
end
```
<!-- End Custom [guide] -->


<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security scheme globally:

| Name         | Type | Scheme      |
| ------------ | ---- | ----------- |
| `secret_key` | http | HTTP Bearer |

To authenticate with the API the `secret_key` parameter must be set when initializing the SDK client instance. For example:
```ruby
require "moderation_api"

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: "<YOUR_BEARER_TOKEN_HERE>"
)
res = s.analytics.summary(range: Models::Operations::GetAnalyticsSummaryQueryParamRange::THIRTYD)

unless res.object.nil?
  # handle response
end

```
<!-- End Authentication [security] -->
<!-- Start Custom [auth] -->
### Project and organization keys

Moderation API has two kinds of API keys:

- A **project key** works with one project: content, authors, review queues, actions, wordlists, webhooks and the account. Most integrations need only this key.
- An **organization key** works with the [management API](https://docs.moderationapi.com/api-reference/management-api): projects and channels. It can also use any project's endpoints: name the project with `projectId`.

A project key can't call the management API: the API returns `403` with the code `organization_key_required`. If you use both kinds of key, create one client for each:

```ruby
require "moderation_api"

# Project key
client = ModerationApi::ModerationApi.new(secret_key: ENV.fetch("MODAPI_SECRET_KEY"))

# Organization key
management = ModerationApi::ModerationApi.new(secret_key: ENV.fetch("MODAPI_ORGANIZATION_KEY"))

management.projects.list.each do |page|
  page.object.data.each { |project| puts "#{project.id} #{project.name}" }
end
```

Create the organization client only where you manage projects and channels, for example in a setup script, and keep the organization key out of the code that moderates content.
<!-- End Custom [auth] -->


<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [Account](docs/sdks/account/README.md)

* [retrieve](docs/sdks/account/README.md#retrieve) - Get account details

### [Actions](docs/sdks/actions/README.md)

* [list](docs/sdks/actions/README.md#list) - List moderation actions
* [create](docs/sdks/actions/README.md#create) - Create an action
* [retrieve](docs/sdks/actions/README.md#retrieve) - Get an action
* [update](docs/sdks/actions/README.md#update) - Update an action
* [delete](docs/sdks/actions/README.md#delete) - Delete an action
* [execute](docs/sdks/actions/README.md#execute) - Execute moderation action

### [Analytics](docs/sdks/analytics/README.md)

* [summary](docs/sdks/analytics/README.md#summary) - Get the analytics summary
* [policies](docs/sdks/analytics/README.md#policies) - Get the most flagged policies
* [authors](docs/sdks/analytics/README.md#authors) - Get the most flagged authors
* [channels](docs/sdks/analytics/README.md#channels) - Get analytics per channel
* [volumes](docs/sdks/analytics/README.md#volumes) - Get volumes over time
* [automation](docs/sdks/analytics/README.md#automation) - Get the automation breakdown

### [Authors](docs/sdks/authors/README.md)

* [list](docs/sdks/authors/README.md#list) - List authors
* [create](docs/sdks/authors/README.md#create) - Create a new author
* [retrieve](docs/sdks/authors/README.md#retrieve) - Get author details
* [update](docs/sdks/authors/README.md#update) - Update author details
* [delete](docs/sdks/authors/README.md#delete) - Delete an author
* [block](docs/sdks/authors/README.md#block) - Block author
* [suspend](docs/sdks/authors/README.md#suspend) - Suspend author
* [unblock](docs/sdks/authors/README.md#unblock) - Unblock author

### [Channels](docs/sdks/channels/README.md)

* [list](docs/sdks/channels/README.md#list) - List channels
* [create](docs/sdks/channels/README.md#create) - Create a channel
* [retrieve](docs/sdks/channels/README.md#retrieve) - Get a channel
* [update](docs/sdks/channels/README.md#update) - Update a channel
* [delete](docs/sdks/channels/README.md#delete) - Delete a channel
* [duplicate](docs/sdks/channels/README.md#duplicate) - Duplicate a channel

### [Content](docs/sdks/content/README.md)

* [reject](docs/sdks/content/README.md#reject) - Reject content
* [allow](docs/sdks/content/README.md#allow) - Allow content
* [submit](docs/sdks/content/README.md#submit) - Submit content

### [Feedback](docs/sdks/feedback/README.md)

* [create](docs/sdks/feedback/README.md#create) - Send feedback

### [Projects](docs/sdks/projects/README.md)

* [list](docs/sdks/projects/README.md#list) - List projects
* [create](docs/sdks/projects/README.md#create) - Create a project
* [retrieve](docs/sdks/projects/README.md#retrieve) - Get a project
* [update](docs/sdks/projects/README.md#update) - Update a project
* [delete](docs/sdks/projects/README.md#delete) - Delete a project
* [duplicate](docs/sdks/projects/README.md#duplicate) - Duplicate a project

#### [Projects.ApiKeys](docs/sdks/apikeys/README.md)

* [create](docs/sdks/apikeys/README.md#create) - Create a project API key

### [Queue](docs/sdks/queue/README.md)

* [list](docs/sdks/queue/README.md#list) - List queues
* [retrieve](docs/sdks/queue/README.md#retrieve) - Get a queue
* [get_stats](docs/sdks/queue/README.md#get_stats) - Get queue statistics

#### [Queue.Items](docs/sdks/items/README.md)

* [list](docs/sdks/items/README.md#list) - List queue items
* [resolve](docs/sdks/items/README.md#resolve) - Resolve a queue item
* [resolve_many](docs/sdks/items/README.md#resolve_many) - Resolve queue items
* [unresolve](docs/sdks/items/README.md#unresolve) - Unresolve a queue item

### [Webhooks](docs/sdks/webhooks/README.md)

* [list](docs/sdks/webhooks/README.md#list) - List webhooks
* [create](docs/sdks/webhooks/README.md#create) - Create a webhook
* [retrieve](docs/sdks/webhooks/README.md#retrieve) - Get a webhook
* [update](docs/sdks/webhooks/README.md#update) - Update a webhook
* [delete](docs/sdks/webhooks/README.md#delete) - Delete a webhook

### [WebhookSecret](docs/sdks/webhooksecret/README.md)

* [retrieve](docs/sdks/webhooksecret/README.md#retrieve) - Get the webhook signing secret

### [Wordlist](docs/sdks/wordlist/README.md)

* [list](docs/sdks/wordlist/README.md#list) - List wordlists
* [create](docs/sdks/wordlist/README.md#create) - Create wordlist
* [retrieve](docs/sdks/wordlist/README.md#retrieve) - Get wordlist
* [update](docs/sdks/wordlist/README.md#update) - Update wordlist
* [get_embedding_status](docs/sdks/wordlist/README.md#get_embedding_status) - Get embedding status

#### [Wordlist.Words](docs/sdks/words/README.md)

* [add](docs/sdks/words/README.md#add) - Add words to wordlist
* [remove](docs/sdks/words/README.md#remove) - Remove words from wordlist

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Error Handling [errors] -->
## Error Handling

Handling errors in this SDK should largely match your expectations. All operations return a response object or raise an error.

By default an API error will raise a `Errors::APIError`, which has the following properties:

| Property       | Type                                    | Description           |
|----------------|-----------------------------------------|-----------------------|
| `message`     | *string*                                 | The error message     |
| `status_code`  | *int*                                   | The HTTP status code  |
| `raw_response` | *Faraday::Response*                     | The raw HTTP response |
| `body`        | *string*                                 | The response content  |

When custom error responses are specified for an operation, the SDK may also throw their associated exception. You can refer to respective *Errors* tables in SDK docs for more details on possible exception types for each operation. For example, the `summary` method throws the following exceptions:

| Error Type                            | Status Code | Content Type     |
| ------------------------------------- | ----------- | ---------------- |
| Models::Errors::BadRequestError       | 400         | application/json |
| Models::Errors::AuthenticationError   | 401         | application/json |
| Models::Errors::PermissionDeniedError | 403         | application/json |
| Models::Errors::NotFoundError         | 404         | application/json |
| Models::Errors::RateLimitError        | 429         | application/json |
| Models::Errors::InternalServerError   | 500         | application/json |
| Errors::APIError                      | 4XX, 5XX    | \*/\*            |

### Example

```ruby
require "moderation_api"

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: "<YOUR_BEARER_TOKEN_HERE>"
)

begin
  res = s.analytics.summary(range: Models::Operations::GetAnalyticsSummaryQueryParamRange::THIRTYD)

  unless res.object.nil?
    # handle response
  end

rescue Models::Errors::BadRequestError => e
  # handle e.container data
  raise e
rescue Models::Errors::AuthenticationError => e
  # handle e.container data
  raise e
rescue Models::Errors::PermissionDeniedError => e
  # handle e.container data
  raise e
rescue Models::Errors::NotFoundError => e
  # handle e.container data
  raise e
rescue Models::Errors::RateLimitError => e
  # handle e.container data
  raise e
rescue Models::Errors::InternalServerError => e
  # handle e.container data
  raise e
rescue Errors::APIError => e
  # handle default exception
  raise e
end

```
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Override Server URL Per-Client

The default server can be overridden globally by passing a URL to the `server_url (String)` optional parameter when initializing the SDK client instance. For example:
```ruby
require "moderation_api"

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  server_url: "https://api.moderationapi.com/v1",
  secret_key: "<YOUR_BEARER_TOKEN_HERE>"
)
res = s.analytics.summary(range: Models::Operations::GetAnalyticsSummaryQueryParamRange::THIRTYD)

unless res.object.nil?
  # handle response
end

```
<!-- End Server Selection [server] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->

<!-- Start Custom [more] -->
## Timeouts

Set a timeout in milliseconds for all requests on the client, or for one request:

```ruby
client = ModerationApi::ModerationApi.new(
  secret_key: ENV.fetch("MODAPI_SECRET_KEY"),
  timeout_ms: 10_000
)

client.content.submit(
  body: Operations::SubmitContentRequestBody.new(content: Operations::TextRequest.new(text: "Hello")),
  timeout_ms: 5_000
)
```

## Requirements

Ruby 3.2 or later.


## Support

- [API reference](https://docs.moderationapi.com/api-reference/introduction)
- [Errors and error codes](https://docs.moderationapi.com/api-reference/errors)
- [Rate limits](https://docs.moderationapi.com/api-reference/rate-limits)
- [Guides](https://docs.moderationapi.com/get-started/introduction)
- Email [support@moderationapi.com](mailto:support@moderationapi.com)

Found a bug? Open an issue in this repository. This package is generated from the [Moderation API OpenAPI spec](https://api.moderationapi.com/v1/openapi.json), so pull requests to the generated code can't be merged as they are, but we use them to fix the generator.
<!-- End Custom [more] -->

# Development

## Maturity

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning usage
to a specific package version. This way, you can install the same version each time without breaking changes unless you are intentionally
looking for the latest version.

## Contributions

While we value open-source contributions to this SDK, this library is generated programmatically. Any manual changes added to internal files will be overwritten on the next generation. 
We look forward to hearing your feedback. Feel free to open a PR or an issue with a proof of concept and we'll do our best to include it in a future release. 

### SDK Created by [Speakeasy](https://www.speakeasy.com/?utm_source=moderation-api&utm_campaign=ruby)
