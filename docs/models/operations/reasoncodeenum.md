# ReasonCodeEnum

## Example Usage

```ruby
require "moderation_api"

value = ReasonCodeEnum::SEVERITY_REJECT

# Open enum: use .deserialize() to create instances from custom string values
custom = ReasonCodeEnum.deserialize("custom_value")
```


## Values

| Name                 | Value                |
| -------------------- | -------------------- |
| `SEVERITY_REJECT`    | severity_reject      |
| `SEVERITY_REVIEW`    | severity_review      |
| `AUTHOR_BLOCK`       | author_block         |
| `DRY_RUN`            | dry_run              |
| `TRUSTED_ALLOW`      | trusted_allow        |
| `UNTRUSTED_SEVERITY` | untrusted_severity   |
| `RULE_MATCH`         | rule_match           |
| `RULE_DEFAULT`       | rule_default         |
| `RULE_FALLBACK`      | rule_fallback        |
| `CLIENT_OVERRIDE`    | client_override      |
| `CASEBOOK_MATCH`     | casebook_match       |