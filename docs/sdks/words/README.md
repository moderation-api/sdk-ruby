# Wordlist.Words

## Overview

### Available Operations

* [add](#add) - Add words to wordlist
* [remove](#remove) - Remove words from wordlist

## add

Add words to an existing wordlist

### Example Usage

<!-- UsageSnippet language="ruby" operationID="addWordlistWords" method="post" path="/wordlist/{id}/words" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.wordlist.words.add(id: '<id>', body: Models::Operations::AddWordlistWordsRequestBody.new(
  words: [
    'free money',
    'click here',
  ]
))

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                                                                                 | Type                                                                                                      | Required                                                                                                  | Description                                                                                               |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| `id`                                                                                                      | *::String*                                                                                                | :heavy_check_mark:                                                                                        | ID of the wordlist to add words to                                                                        |
| `body`                                                                                                    | [Models::Operations::AddWordlistWordsRequestBody](../../models/operations/addwordlistwordsrequestbody.md) | :heavy_check_mark:                                                                                        | N/A                                                                                                       |

### Response

**[T.nilable(Models::Operations::AddWordlistWordsResponse)](../../models/operations/addwordlistwordsresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |

## remove

Remove words from an existing wordlist

### Example Usage

<!-- UsageSnippet language="ruby" operationID="removeWordlistWords" method="delete" path="/wordlist/{id}/words" -->
```ruby
require 'moderation_api'

Models = ::ModerationApi::Models
s = ::ModerationApi::ModerationApi.new(
  secret_key: '<YOUR_BEARER_TOKEN_HERE>'
)
res = s.wordlist.words.remove(id: '<id>', words: [
  '<value 1>',
  '<value 2>',
  '<value 3>',
])

unless res.object.nil?
  # handle response
end

```

### Parameters

| Parameter                                  | Type                                       | Required                                   | Description                                |
| ------------------------------------------ | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| `id`                                       | *::String*                                 | :heavy_check_mark:                         | ID of the wordlist to remove words from    |
| `words`                                    | T::Array<*::String*>                       | :heavy_check_mark:                         | Array of words to remove from the wordlist |

### Response

**[T.nilable(Models::Operations::RemoveWordlistWordsResponse)](../../models/operations/removewordlistwordsresponse.md)**

### Errors

| Error Type                          | Status Code                         | Content Type                        |
| ----------------------------------- | ----------------------------------- | ----------------------------------- |
| Models::Errors::BadRequestError     | 400                                 | application/json                    |
| Models::Errors::AuthenticationError | 401                                 | application/json                    |
| Models::Errors::NotFoundError       | 404                                 | application/json                    |
| Models::Errors::RateLimitError      | 429                                 | application/json                    |
| Errors::APIError                    | 4XX, 5XX                            | \*/\*                               |