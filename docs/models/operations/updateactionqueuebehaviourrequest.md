# UpdateActionQueueBehaviourRequest

Whether the action resolves and removes the item, unresolves and re-add it to the queue, or does not change the resolve status.

## Example Usage

```ruby
require "moderation_api"

value = UpdateActionQueueBehaviourRequest::REMOVE
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `REMOVE`    | REMOVE      |
| `ADD`       | ADD         |
| `NO_CHANGE` | NO_CHANGE   |