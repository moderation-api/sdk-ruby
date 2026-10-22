# BadRequestErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `invalid_request`: A parameter is invalid. `message` says which one.
- `project_id_required`: An organization key called a project endpoint without naming the project in `Project-Id`, and the organization has more than one project.
- `validation_failed`: The request body does not match the schema. `issues` lists each problem with its `path`.

## Example Usage

```ruby
require "moderation_api"

value = BadRequestErrorCode::INVALID_REQUEST

# Open enum: use .deserialize() to create instances from custom string values
custom = BadRequestErrorCode.deserialize("custom_value")
```


## Values

| Name                  | Value                 |
| --------------------- | --------------------- |
| `INVALID_REQUEST`     | invalid_request       |
| `PROJECT_ID_REQUIRED` | project_id_required   |
| `VALIDATION_FAILED`   | validation_failed     |