# GetQueueRecommendationAction

## Example Usage

```ruby
require "moderation_api"

value = GetQueueRecommendationAction::REVIEW

# Open enum: use .deserialize() to create instances from custom string values
custom = GetQueueRecommendationAction.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `REVIEW` | review   |
| `ALLOW`  | allow    |
| `REJECT` | reject   |