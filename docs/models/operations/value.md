# Value

## Example Usage

```ruby
require "moderation_api"

value = Value::POSITIVE

# Open enum: use .deserialize() to create instances from custom string values
custom = Value.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `POSITIVE` | positive   |
| `NEUTRAL`  | neutral    |
| `NEGATIVE` | negative   |