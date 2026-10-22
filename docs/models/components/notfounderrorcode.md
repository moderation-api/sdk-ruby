# NotFoundErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `resource_not_found`: The resource does not exist.
- `action_not_found`: The action does not exist.
- `author_not_found`: The author does not exist.
- `queue_not_found`: The review queue does not exist.
- `wordlist_not_found`: The wordlist does not exist.
- `webhook_not_found`: The webhook does not exist.
- `project_not_found`: The project does not exist.
- `channel_not_found`: The channel does not exist.

## Example Usage

```ruby
require "moderation_api"

value = NotFoundErrorCode::RESOURCE_NOT_FOUND

# Open enum: use .deserialize() to create instances from custom string values
custom = NotFoundErrorCode.deserialize("custom_value")
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `RESOURCE_NOT_FOUND` | resource_not_found   |
| `ACTION_NOT_FOUND`   | action_not_found     |
| `AUTHOR_NOT_FOUND`   | author_not_found     |
| `QUEUE_NOT_FOUND`    | queue_not_found      |
| `WORDLIST_NOT_FOUND` | wordlist_not_found   |
| `WEBHOOK_NOT_FOUND`  | webhook_not_found    |
| `PROJECT_NOT_FOUND`  | project_not_found    |
| `CHANNEL_NOT_FOUND`  | channel_not_found    |