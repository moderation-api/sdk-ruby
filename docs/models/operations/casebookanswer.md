# CasebookAnswer

## Example Usage

```ruby
require "moderation_api"

value = CasebookAnswer::ALL

# Open enum: use .deserialize() to create instances from custom string values
custom = CasebookAnswer.deserialize("custom_value")
```


## Values

| Name        | Value       |
| ----------- | ----------- |
| `ALL`       | ALL         |
| `ALLOWED`   | ALLOWED     |
| `REJECTED`  | REJECTED    |
| `NO_ANSWER` | NO_ANSWER   |