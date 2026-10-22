# InternalServerErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `internal_error`: Something went wrong on our side. Retry with backoff.

## Example Usage

```ruby
require "moderation_api"

value = InternalServerErrorCode::INTERNAL_ERROR

# Open enum: use .deserialize() to create instances from custom string values
custom = InternalServerErrorCode.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `INTERNAL_ERROR` | internal_error   |