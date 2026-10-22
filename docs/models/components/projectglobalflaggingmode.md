# ProjectGlobalFlaggingMode

`ACTIVE` flags content. `DRY_RUN` evaluates content without flagging it, for testing a setup.

## Example Usage

```ruby
require "moderation_api"

value = ProjectGlobalFlaggingMode::DRY_RUN

# Open enum: use .deserialize() to create instances from custom string values
custom = ProjectGlobalFlaggingMode.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `DRY_RUN` | DRY_RUN   |
| `ACTIVE`  | ACTIVE    |