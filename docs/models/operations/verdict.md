# Verdict

The ruling your past decisions point to for this content.

## Example Usage

```ruby
require "moderation_api"

value = Verdict::ALLOW

# Open enum: use .deserialize() to create instances from custom string values
custom = Verdict.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `ALLOW`  | allow    |
| `REJECT` | reject   |