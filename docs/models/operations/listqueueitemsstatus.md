# ListQueueItemsStatus

Status of the item

## Example Usage

```ruby
require "moderation_api"

value = ListQueueItemsStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = ListQueueItemsStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `PENDING`  | pending    |
| `RESOLVED` | resolved   |