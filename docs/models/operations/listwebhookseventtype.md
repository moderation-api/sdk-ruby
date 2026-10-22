# ListWebhooksEventType

## Example Usage

```ruby
require "moderation_api"

value = ListWebhooksEventType::QUEUE_ITEM_NEW

# Open enum: use .deserialize() to create instances from custom string values
custom = ListWebhooksEventType.deserialize("custom_value")
```


## Values

| Name                         | Value                        |
| ---------------------------- | ---------------------------- |
| `QUEUE_ITEM_NEW`             | QUEUE_ITEM_NEW               |
| `QUEUE_ITEM_COMPLETED`       | QUEUE_ITEM_COMPLETED         |
| `QUEUE_ITEM_ACTION`          | QUEUE_ITEM_ACTION            |
| `QUEUE_ITEM_REJECTED`        | QUEUE_ITEM_REJECTED          |
| `QUEUE_ITEM_ALLOWED`         | QUEUE_ITEM_ALLOWED           |
| `AUTHOR_BLOCKED`             | AUTHOR_BLOCKED               |
| `AUTHOR_UNBLOCKED`           | AUTHOR_UNBLOCKED             |
| `AUTHOR_SUSPENDED`           | AUTHOR_SUSPENDED             |
| `AUTHOR_UPDATED`             | AUTHOR_UPDATED               |
| `AUTHOR_TRUST_LEVEL_CHANGED` | AUTHOR_TRUST_LEVEL_CHANGED   |
| `AUTHOR_ACTION`              | AUTHOR_ACTION                |