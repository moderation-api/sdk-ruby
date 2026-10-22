# CreateActionPositionResponse

Show the action in all queues, selected queues or no queues (to use via API only).

## Example Usage

```ruby
require "moderation_api"

value = CreateActionPositionResponse::ALL_QUEUES

# Open enum: use .deserialize() to create instances from custom string values
custom = CreateActionPositionResponse.deserialize("custom_value")
```


## Values

| Name          | Value         |
| ------------- | ------------- |
| `ALL_QUEUES`  | ALL_QUEUES    |
| `SOME_QUEUES` | SOME_QUEUES   |
| `HIDDEN`      | HIDDEN        |