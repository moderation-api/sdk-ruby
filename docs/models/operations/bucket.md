# Bucket

The size of each entry in `volumes`.

## Example Usage

```ruby
require "moderation_api"

value = Bucket::HOUR

# Open enum: use .deserialize() to create instances from custom string values
custom = Bucket.deserialize("custom_value")
```


## Values

| Name   | Value  |
| ------ | ------ |
| `HOUR` | hour   |
| `DAY`  | day    |