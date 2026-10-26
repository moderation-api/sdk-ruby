# UnresolveQueueItemStatus

`pending` waits for review. `resolved` is reviewed.

## Example Usage

```ruby
require "moderation_api"

value = UnresolveQueueItemStatus::PENDING

# Open enum: use .deserialize() to create instances from custom string values
custom = UnresolveQueueItemStatus.deserialize("custom_value")
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `PENDING`  | pending    |
| `RESOLVED` | resolved   |