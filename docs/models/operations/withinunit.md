# WithinUnit

## Example Usage

```ruby
require "moderation_api"

value = WithinUnit::MINUTES

# Open enum: use .deserialize() to create instances from custom string values
custom = WithinUnit.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `MINUTES` | MINUTES   |
| `HOURS`   | HOURS     |
| `DAYS`    | DAYS      |
| `WEEKS`   | WEEKS     |
| `MONTHS`  | MONTHS    |
| `YEARS`   | YEARS     |