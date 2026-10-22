# CheckStatus

## Example Usage

```ruby
require "moderation_api"

value = CheckStatus::ALL

# Open enum: use .deserialize() to create instances from custom string values
custom = CheckStatus.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `ALL`       | all         |
| `CHECKED`   | checked     |
| `UNCHECKED` | unchecked   |