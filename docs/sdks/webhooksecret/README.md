# WebhookSecret

## Overview

### Available Operations

* [retrieve](#retrieve) - Get the webhook signing secret

## retrieve

Get the signing secret used to sign webhook deliveries for this project, creating one if none exists yet. Verify deliveries by comparing the `modapi-signature` header to HMAC-SHA256(raw request body, secret) hex-encoded.

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getWebhookSecret" method="get" path="/webhook-secret" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.webhook_secret.retrieve

unless res.object.nil?
  # handle response
end

```

### Response

**[T.nilable(Models::Operations::GetWebhookSecretResponse)](../../models/operations/getwebhooksecretresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |