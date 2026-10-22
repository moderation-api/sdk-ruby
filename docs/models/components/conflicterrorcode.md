# ConflictErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `resource_conflict`: The request conflicts with an existing resource.

## Example Usage

```ruby
require "moderation_api"

value = ConflictErrorCode::RESOURCE_CONFLICT

# Open enum: use .deserialize() to create instances from custom string values
custom = ConflictErrorCode.deserialize("custom_value")
```


## Values

| Name                | Value               |
| ------------------- | ------------------- |
| `RESOURCE_CONFLICT` | resource_conflict   |