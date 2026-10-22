# MediaType

## Example Usage

```ruby
require "moderation_api"

value = MediaType::TEXT

# Open enum: use .deserialize() to create instances from custom string values
custom = MediaType.deserialize("custom_value")
```


## Values

| Name     | Value    |
| -------- | -------- |
| `TEXT`   | text     |
| `IMAGE`  | image    |
| `VIDEO`  | video    |
| `OBJECT` | object   |
| `AUDIO`  | audio    |