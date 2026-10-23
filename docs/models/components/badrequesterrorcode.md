# BadRequestErrorCode

Exactly what went wrong. Stable; safe to branch on. New codes may be added.

- `invalid_request`: A parameter is invalid. `message` says which one.
- `project_id_required`: An organization key called a project endpoint without naming the project in `Project-Id`, and the key reaches more than one project. `message` lists the projects it reaches.
- `project_name_ambiguous`: The name in `Project-Id` fits more than one project the key reaches. `message` lists them; name the project by ID instead.
- `validation_failed`: The request body does not match the schema. `issues` lists each problem with its `path`.

## Example Usage

```ruby
require "moderation_api"

value = BadRequestErrorCode::INVALID_REQUEST

# Open enum: use .deserialize() to create instances from custom string values
custom = BadRequestErrorCode.deserialize("custom_value")
```


## Values

| Name                     | Value                    |
| ------------------------ | ------------------------ |
| `INVALID_REQUEST`        | invalid_request          |
| `PROJECT_ID_REQUIRED`    | project_id_required      |
| `PROJECT_NAME_AMBIGUOUS` | project_name_ambiguous   |
| `VALIDATION_FAILED`      | validation_failed        |