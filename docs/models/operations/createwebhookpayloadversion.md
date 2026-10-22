# CreateWebhookPayloadVersion

Payload envelope version. V2 is the Stripe-style envelope; V1 is the legacy flat shape and is read-only via this API.

## Example Usage

```ruby
require "moderation_api"

value = CreateWebhookPayloadVersion::V1

# Open enum: use .deserialize() to create instances from custom string values
custom = CreateWebhookPayloadVersion.deserialize("custom_value")
```


## Values

| Name  | Value |
| ----- | ----- |
| `V1`  | V1    |
| `V2`  | V2    |