# ContentType

The kind of content the channel moderates.

## Example Usage

```ruby
require "moderation_api"

value = ContentType::PROFILE

# Open enum: use .deserialize() to create instances from custom string values
custom = ContentType.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `PROFILE` | profile   |
| `MESSAGE` | message   |
| `POST`    | post      |
| `COMMENT` | comment   |
| `EVENT`   | event     |
| `PRODUCT` | product   |
| `REVIEW`  | review    |
| `VOICE`   | voice     |
| `OTHER`   | other     |