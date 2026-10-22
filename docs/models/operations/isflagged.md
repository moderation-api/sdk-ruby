# IsFlagged

## Example Usage

```ruby
require "moderation_api"

value = IsFlagged::ALL

# Open enum: use .deserialize() to create instances from custom string values
custom = IsFlagged.deserialize("custom_value")
```


## Values

| Name             | Value            |
| ---------------- | ---------------- |
| `ALL`            | ALL              |
| `FLAGGED`        | FLAGGED          |
| `NOT_FLAGGED`    | NOT_FLAGGED      |
| `SHADOW_FLAGGED` | SHADOW_FLAGGED   |