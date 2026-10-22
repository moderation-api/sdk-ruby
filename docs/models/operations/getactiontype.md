# GetActionType

## Example Usage

```ruby
require "moderation_api"

value = GetActionType::AUTHOR_BLOCK

# Open enum: use .deserialize() to create instances from custom string values
custom = GetActionType.deserialize("custom_value")
```


## Values

| Name                | Value               |
| ------------------- | ------------------- |
| `AUTHOR_BLOCK`      | AUTHOR_BLOCK        |
| `AUTHOR_BLOCK_TEMP` | AUTHOR_BLOCK_TEMP   |
| `AUTHOR_UNBLOCK`    | AUTHOR_UNBLOCK      |
| `AUTHOR_DELETE`     | AUTHOR_DELETE       |
| `AUTHOR_REPORT`     | AUTHOR_REPORT       |
| `AUTHOR_WARN`       | AUTHOR_WARN         |
| `AUTHOR_CUSTOM`     | AUTHOR_CUSTOM       |
| `ITEM_REJECT`       | ITEM_REJECT         |
| `ITEM_ALLOW`        | ITEM_ALLOW          |
| `ITEM_CUSTOM`       | ITEM_CUSTOM         |