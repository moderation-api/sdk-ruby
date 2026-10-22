# AuthorStatus

Current author status

## Example Usage

```ruby
require "moderation_api"

value = AuthorStatus::ENABLED

# Open enum: use .deserialize() to create instances from custom string values
custom = AuthorStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `ENABLED`   | enabled     |
| `SUSPENDED` | suspended   |
| `BLOCKED`   | blocked     |