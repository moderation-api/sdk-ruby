# ProjectWithKeyGlobalFlaggingMode

`ACTIVE` flags content. `DRY_RUN` evaluates content without flagging it, for testing a setup.

## Example Usage

```ruby
require "moderation_api"

value = ProjectWithKeyGlobalFlaggingMode::DRY_RUN

# Open enum: use .deserialize() to create instances from custom string values
custom = ProjectWithKeyGlobalFlaggingMode.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `DRY_RUN` | DRY_RUN   |
| `ACTIVE`  | ACTIVE    |