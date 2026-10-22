# Behavior

How your recommendation combines with ours. Defaults to 'escalate', which only applies it when stricter than ours; 'override' replaces ours outright.

## Example Usage

```ruby
require "moderation_api"

value = Behavior::OVERRIDE
```


## Values

| Name       | Value      |
| ---------- | ---------- |
| `OVERRIDE` | override   |
| `ESCALATE` | escalate   |