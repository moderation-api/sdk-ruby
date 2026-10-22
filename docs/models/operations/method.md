# Method

## Example Usage

```ruby
require "moderation_api"

value = Method::REGISTERED_DOMAIN_TOKEN

# Open enum: use .deserialize() to create instances from custom string values
custom = Method.deserialize("custom_value")
```


## Values

| Name                      | Value                     |
| ------------------------- | ------------------------- |
| `REGISTERED_DOMAIN_TOKEN` | registered_domain_token   |
| `SUBDOMAIN_TOKEN`         | subdomain_token           |