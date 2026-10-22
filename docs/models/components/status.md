# Status

Current author status

## Example Usage

```ruby
require "moderation_api"

value = Status::ENABLED

# Open enum: use .deserialize() to create instances from custom string values
custom = Status.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `ENABLED`   | enabled     |
| `SUSPENDED` | suspended   |
| `BLOCKED`   | blocked     |