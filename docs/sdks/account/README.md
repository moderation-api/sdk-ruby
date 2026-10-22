# Account

## Overview

### Available Operations

* [retrieve](#retrieve) - Get account details

## retrieve

Get account details

### Example Usage

<!-- UsageSnippet language="ruby" operationID="getAccount" method="get" path="/account" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.account.retrieve

unless res.object.nil?
  # handle response
end

```

### Response

**[T.nilable(Models::Operations::GetAccountResponse)](../../models/operations/getaccountresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |