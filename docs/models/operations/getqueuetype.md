# GetQueueType

## Example Usage

```ruby
require "moderation_api"

value = GetQueueType::FLAGGED

# Open enum: use .deserialize() to create instances from custom string values
custom = GetQueueType.deserialize("custom_value")
```


## Values

| Name          | Value         |
| ------------- | ------------- |
| `FLAGGED`     | FLAGGED       |
| `NOT_FLAGGED` | NOT_FLAGGED   |
| `THRESHOLDS`  | THRESHOLDS    |
| `MATCHED`     | MATCHED       |