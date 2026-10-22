# BadRequestErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `invalid_request`: A parameter is invalid. `message` says which one.
- `validation_failed`: The request body does not match the schema. `issues` lists each problem with its `path`.

## Example Usage

```ruby
require "moderation_api"

value = BadRequestErrorCode::INVALID_REQUEST

# Open enum: use .deserialize() to create instances from custom string values
custom = BadRequestErrorCode.deserialize("custom_value")
```


## Values

| Name                | Value               |
| ------------------- | ------------------- |
| `INVALID_REQUEST`   | invalid_request     |
| `VALIDATION_FAILED` | validation_failed   |