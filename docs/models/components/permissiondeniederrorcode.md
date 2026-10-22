# PermissionDeniedErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `permission_denied`: The API key cannot perform this request.
- `account_disabled`: The organization account is disabled.
- `quota_exceeded`: The organization has used all API requests on its plan.
- `plan_feature_unavailable`: The current plan does not include this feature.
- `plan_limit_exceeded`: The request goes over a limit of the current plan.
- `organization_key_required`: This endpoint needs an organization API key, but a project key was used.
- `missing_key_permission`: The organization key does not have the permission this endpoint needs.
- `project_not_reachable`: The organization key is limited to other projects.

## Example Usage

```ruby
require "moderation_api"

value = PermissionDeniedErrorCode::PERMISSION_DENIED

# Open enum: use .deserialize() to create instances from custom string values
custom = PermissionDeniedErrorCode.deserialize("custom_value")
```


## Values

| Name                        | Value                       |
| --------------------------- | --------------------------- |
| `PERMISSION_DENIED`         | permission_denied           |
| `ACCOUNT_DISABLED`          | account_disabled            |
| `QUOTA_EXCEEDED`            | quota_exceeded              |
| `PLAN_FEATURE_UNAVAILABLE`  | plan_feature_unavailable    |
| `PLAN_LIMIT_EXCEEDED`       | plan_limit_exceeded         |
| `ORGANIZATION_KEY_REQUIRED` | organization_key_required   |
| `MISSING_KEY_PERMISSION`    | missing_key_permission      |
| `PROJECT_NOT_REACHABLE`     | project_not_reachable       |