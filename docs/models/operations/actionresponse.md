# ActionResponse

The action to take based on the recommendation

## Example Usage

```ruby
require "moderation_api"

value = ActionResponse::REVIEW

# Open enum: use .deserialize() to create instances from custom string values
custom = ActionResponse.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `REVIEW` | review   |
| `ALLOW`  | allow    |
| `REJECT` | reject   |