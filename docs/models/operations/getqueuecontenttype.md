# GetQueueContentType

## Example Usage

```ruby
require "moderation_api"

value = GetQueueContentType::PROFILE

# Open enum: use .deserialize() to create instances from custom string values
custom = GetQueueContentType.deserialize("custom_value")
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