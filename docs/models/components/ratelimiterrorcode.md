# RateLimitErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `rate_limit_exceeded`: Too many requests. Wait for the `Retry-After` seconds.

## Example Usage

```ruby
require "moderation_api"

value = RateLimitErrorCode::RATE_LIMIT_EXCEEDED

# Open enum: use .deserialize() to create instances from custom string values
custom = RateLimitErrorCode.deserialize("custom_value")
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `RATE_LIMIT_EXCEEDED` | rate_limit_exceeded   |