# MetaStatus

## Example Usage

```ruby
require "moderation_api"

value = MetaStatus::SUCCESS

# Open enum: use .deserialize() to create instances from custom string values
custom = MetaStatus.deserialize("custom_value")
```


## Values

| Name              | Value             |
| ----------------- | ----------------- |
| `SUCCESS`         | success           |
| `PARTIAL_SUCCESS` | partial_success   |