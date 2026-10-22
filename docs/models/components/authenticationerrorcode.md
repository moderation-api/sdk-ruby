# AuthenticationErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `unauthorized`: Authentication failed.
- `missing_api_key`: No API key in the `Authorization` header.
- `malformed_api_key`: The `Authorization` header does not contain a valid key format.
- `invalid_api_key`: The API key does not exist or was revoked.

## Example Usage

```ruby
require "moderation_api"

value = AuthenticationErrorCode::UNAUTHORIZED

# Open enum: use .deserialize() to create instances from custom string values
custom = AuthenticationErrorCode.deserialize("custom_value")
```


## Values

| Name                | Value               |
| ------------------- | ------------------- |
| `UNAUTHORIZED`      | unauthorized        |
| `MISSING_API_KEY`   | missing_api_key     |
| `MALFORMED_API_KEY` | malformed_api_key   |
| `INVALID_API_KEY`   | invalid_api_key     |