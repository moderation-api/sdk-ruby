# FlaggingMode

`ACTIVE` flags content. `DRY_RUN` evaluates content without flagging it.

## Example Usage

```ruby
require "moderation_api"

value = FlaggingMode::DRY_RUN

# Open enum: use .deserialize() to create instances from custom string values
custom = FlaggingMode.deserialize("custom_value")
```


## Values

| Name      | Value     |
| --------- | --------- |
| `DRY_RUN` | DRY_RUN   |
| `ACTIVE`  | ACTIVE    |